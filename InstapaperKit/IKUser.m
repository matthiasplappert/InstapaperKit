//
//  IKUser.m
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IKUser.h"


@implementation IKUser

@synthesize userID = _userID, username = _username, subscribed = _subscribed;

- (id)init
{
    if ((self = [super init])) {
        _userID     = NSNotFound;
        _username   = nil;
        _subscribed = NO;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@ (%d), subscribed:%d>", NSStringFromClass([self class]),
                                                                       self.username,
                                                                       self.userID,
                                                                       self.subscribed];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_username release];
    [super dealloc];
}

@end
