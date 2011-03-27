//
//  IKConstants.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


// Error domain
extern NSString *const IKErrorDomain;

// Error keys
extern NSString *const IKErrorMessageKey;

// Error keys
enum {
    // General errors
    IKErrorCodeRateLimitExceeded           = 1040,
    IKErrorCodeSubscriptionAccountRequired = 1041,
    IKErrorCodeApplicationSuspended        = 1042,
    
    // Bookmark errors
    IKErrorCodeDomainRequiresContent          = 1220,
    IKErrorCodeDomainOptedOut                 = 1221,
    IKErrorCodeDomainInvalidURL               = 1240,
    IKErrorCodeInvalidBookmarkID              = 1241,
    IKErrorCodeInvalidFolderID                = 1242,
    IKErrorCodeInvalidProgress                = 1243,
    IKErrorCodeInvalidProgressTimestamp       = 1244,
    IKErrorCodePrivateBookmarkRequiresContent = 1245,
    IKErrorCodeUnexpectedBookmarkError        = 1250,
    
    // Folder errors
    IKErrorCodeInvalidTitle        = 1250,
    IKErrorCodeFolderAlreadyExists = 1251,
    IKErrorCodeCannotAddBookmark   = 1252,
    
    // Operational errors
    IKErrorCodeUnexpectedServiceError   = 1500,
    IKErrorCodeErrorGeneratingTextOfURL = 1550
};