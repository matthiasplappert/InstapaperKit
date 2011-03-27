//
//  NSString+IKEncoding.m
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+IKEncoding.h"


@implementation NSString (IKEncoding)

- (NSString *)URLEncodedStringUsingEncoding:(NSStringEncoding)stringEncoding
{
    CFStringEncoding encoding = CFStringConvertNSStringEncodingToEncoding(stringEncoding);
    CFStringRef legalChars    = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, legalChars, encoding);
    return [(NSString *)encodedString autorelease];
}

@end
