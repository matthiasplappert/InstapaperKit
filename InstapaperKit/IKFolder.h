//
//  IKFolder.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


enum {
    IKUnreadFolderID  = -1,
    IKStarredFolderID = -2,
    IKArchiveFolderID = -3
};


@interface IKFolder : NSObject {
    NSInteger _folderID;
    NSString *_title;
    BOOL _syncToMobile;
    NSUInteger _position;
}

@property (nonatomic, assign) NSInteger folderID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL syncToMobile;
@property (nonatomic, assign) NSUInteger position;

+ (IKFolder *)unreadFolder;
+ (IKFolder *)starredFolder;
+ (IKFolder *)archiveFolder;
+ (IKFolder *)folderWithFolderID:(NSInteger)folderID;
- (id)initWithFolderID:(NSInteger)folderID;

@end
