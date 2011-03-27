//
//  IKFolder.m
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IKFolder.h"


@implementation IKFolder

@synthesize folderID = _folderID, title = _title, syncToMobile = _syncToMobile, position = _position;

#pragma mark -
#pragma mark Factory methods

+ (IKFolder *)unreadFolder
{
    return [self folderWithFolderID:IKUnreadFolderID];
}

+ (IKFolder *)starredFolder
{
    return [self folderWithFolderID:IKStarredFolderID];
}

+ (IKFolder *)archiveFolder
{
    return [self folderWithFolderID:IKArchiveFolderID];
}

+ (IKFolder *)folderWithFolderID:(NSInteger)folderID
{
    IKFolder *folder = [[[IKFolder alloc] initWithFolderID:folderID] autorelease];
    return folder;
}

#pragma mark -
#pragma mark Init

- (id)init
{
    return [self initWithFolderID:NSNotFound];
}

- (id)initWithFolderID:(NSInteger)folderID
{
    if ((self = [super init])) {
        _folderID     = folderID;
        _title        = nil;
        _syncToMobile = NO;
        _position     = 0;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@ (%d)>", NSStringFromClass([self class]),
                                                        self.title, self.folderID];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_title release];
    [super dealloc];
}

@end
