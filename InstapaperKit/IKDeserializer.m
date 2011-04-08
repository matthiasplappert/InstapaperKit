//
//  IKDeserializer.m
//  InstapaperKit
//
//  Copyright (c) 2011 Matthias Plappert <matthiasplappert@me.com>
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "IKDeserializer.h"
#import "IKUser.h"
#import "IKBookmark.h"
#import "IKFolder.h"
#import "IKConstants.h"

#import "JSONKit.h"


@interface IKDeserializer ()

+ (id)_normalizedObjectForKey:(NSString *)key inDictionary:(NSDictionary *)dict;
+ (NSURL *)_URLForKey:(NSString *)key inDictionary:(NSDictionary *)dict;
+ (NSDate *)_dateForKey:(NSString *)key inDictionary:(NSDictionary *)dict;

@end


@implementation IKDeserializer

+ (BOOL)token:(NSString **)token andTokenSecret:(NSString **)secret fromQlineString:(NSString *)qlineString
{
    // Extract token & secret
    NSArray *parts = [qlineString componentsSeparatedByString:@"&"];
    for (NSString *part in parts) {
        NSArray *subparts = [part componentsSeparatedByString:@"="];
        if ([subparts count] != 2) {
            // Invalid, skip
            continue;
        }
        
        NSString *key   = [subparts objectAtIndex:0];
        NSString *value = [subparts objectAtIndex:1];
        if ([key isEqualToString:@"oauth_token"]) {
            *token = value;
        } else if ([key isEqualToString:@"oauth_token_secret"]) {
            *secret = value;
        }
    }
    
    if (!*token || !*secret) {
        *token  = nil;
        *secret = nil;
        return NO;
    }
    
    return YES;
}

+ (id)objectFromJSONString:(NSString *)JSONString
{
    if (!JSONString) {
        return nil;
    }
    
    // Parse JSON
    NSArray *JSONArray = [JSONString objectFromJSONString];
    if (![JSONArray isKindOfClass:[NSArray class]] && ![JSONArray isKindOfClass:NSClassFromString(@"JKArray")]) {
        // Invalid JSON
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < [JSONArray count]; i++) {
        NSDictionary *dict = [JSONArray objectAtIndex:i];
        
        if (![dict isKindOfClass:[NSDictionary class]] && ![dict isKindOfClass:NSClassFromString(@"JKDictionary")]) {
            // Skip
            continue;
        }
        
        // Get type
        NSString *type = [dict objectForKey:@"type"];
        if ([type isEqualToString:@"error"]) {
            // Return error object, not array
            NSInteger code         = [[dict objectForKey:@"error_code"] integerValue];
            NSString *message      = [dict objectForKey:@"message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:IKErrorMessageKey];
            
            return [NSError errorWithDomain:IKErrorDomain code:code userInfo:userInfo];
            
        } else if ([type isEqualToString:@"user"]) {
            // Create user object
            IKUser *user = [[IKUser alloc] init];
            
            user.userID     = [[self _normalizedObjectForKey:@"user_id" inDictionary:dict] unsignedIntegerValue];
            user.username   = [self _normalizedObjectForKey:@"username" inDictionary:dict];
            user.subscribed = [[self _normalizedObjectForKey:@"subscription_is_active" inDictionary:dict] boolValue];
            
            [result addObject:user];
            
        } else if ([type isEqualToString:@"bookmark"]) {
            // Create bookmark object
            IKBookmark *bookmark = [[IKBookmark alloc] init];
            
            bookmark.bookmarkID    = [[self _normalizedObjectForKey:@"bookmark_id" inDictionary:dict] integerValue];
            bookmark.URL           = [self _URLForKey:@"url" inDictionary:dict];
            bookmark.title         = [self _normalizedObjectForKey:@"title" inDictionary:dict];
            bookmark.descr         = [self _normalizedObjectForKey:@"descr" inDictionary:dict];
            bookmark.date          = [self _dateForKey:@"time" inDictionary:dict];
            bookmark.starred       = [[self _normalizedObjectForKey:@"starred" inDictionary:dict] boolValue];
            bookmark.privateSource = [self _normalizedObjectForKey:@"private_source" inDictionary:dict];
            bookmark.hashString    = [self _normalizedObjectForKey:@"hash" inDictionary:dict];
            bookmark.progress      = [[self _normalizedObjectForKey:@"progress" inDictionary:dict] floatValue];
            bookmark.progressDate  = [self _dateForKey:@"progress_timestamp" inDictionary:dict];
            
            [result addObject:bookmark];

        } else if ([type isEqualToString:@"folder"]) {
            // Create folder object
            IKFolder *folder = [[IKFolder alloc] init];
            
            folder.folderID     = [[self _normalizedObjectForKey:@"folder_id" inDictionary:dict] integerValue];
            folder.title        = [self _normalizedObjectForKey:@"title" inDictionary:dict];
            folder.syncToMobile = [[self _normalizedObjectForKey:@"sync_to_mobile" inDictionary:dict] boolValue];
            folder.position     = [[self _normalizedObjectForKey:@"position" inDictionary:dict] unsignedIntegerValue];
            
            [result addObject:folder];
            
        }
    }
    
    return result;
}

#pragma mark -
#pragma mark Private methods

+ (id)_normalizedObjectForKey:(NSString *)key inDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:key];
    if ((NSNull *)object == [NSNull null]) {
        return nil;
    }
    
    return object;
}

+ (NSURL *)_URLForKey:(NSString *)key inDictionary:(NSDictionary *)dict
{
    NSString *URLString = [self _normalizedObjectForKey:key inDictionary:dict];
    if (!URLString || ![URLString isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [NSURL URLWithString:URLString];
}

+ (NSDate *)_dateForKey:(NSString *)key inDictionary:(NSDictionary *)dict
{
    id object = [self _normalizedObjectForKey:key inDictionary:dict];
    if (!object || ![object respondsToSelector:@selector(unsignedIntegerValue)]) {
        return nil;
    }
    
    NSUInteger unixTimestamp = [(NSNumber *)object unsignedIntegerValue];
    return [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)unixTimestamp];
}

@end
