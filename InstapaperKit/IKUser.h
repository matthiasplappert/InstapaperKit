//
//  IKUser.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKUser : NSObject {
    NSUInteger _userID;
    NSString *_username;
    BOOL _subscribed;
}

@property (nonatomic, assign) NSUInteger userID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign, getter=isSubscribed) BOOL subscribed;

@end
