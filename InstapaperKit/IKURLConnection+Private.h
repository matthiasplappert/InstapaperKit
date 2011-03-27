//
//  IKURLConnection+Private.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IKURLConnection.h"


typedef enum {
    IKURLConnectionTypeUnknown = -1,
    
    IKURLConnectionTypeAuthAccessToken,
    IKURLConnectionTypeAuthVerifyCredentials,
    
    IKURLConnectionTypeBookmarksList,
    IKURLConnectionTypeBookmarksUpdateReadProgress,
    IKURLConnectionTypeBookmarksAdd,
    IKURLConnectionTypeBookmarksDelete,
    IKURLConnectionTypeBookmarksStar,
    IKURLConnectionTypeBookmarksUnstar,
    IKURLConnectionTypeBookmarksArchive,
    IKURLConnectionTypeBookmarksUnarchive,
    IKURLConnectionTypeBookmarksMove,
    IKURLConnectionTypeBookmarksText,
    
    IKURLConnectionTypeFoldersList,
    IKURLConnectionTypeFoldersAdd,
    IKURLConnectionTypeFoldersDelete,
    IKURLConnectionTypeFoldersOrder
} IKURLConnectionType;


@interface IKURLConnection (Private)

- (void)_appendData:(NSData *)data;
- (void)_setUserInfo:(id)userInfo;
- (void)_setResponse:(NSHTTPURLResponse *)response;

- (void)_setType:(IKURLConnectionType)type;
- (IKURLConnectionType)_type;
- (void)_setContext:(id)context;
- (id)_context;

@end
