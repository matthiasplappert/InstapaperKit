//
//  IKFolder.m
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
    return [NSString stringWithFormat:@"<%@: %@ (%ld)>", NSStringFromClass([self class]),
                                                        self.title, (long)self.folderID];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_title release];
    [super dealloc];
}

@end
