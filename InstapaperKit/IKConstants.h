//
//  IKConstants.h
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
    // TODO: fix duplicate 1250 error code (waiting for a response from Marco)
    IKErrorCodeInvalidTitle        = 1250,
    IKErrorCodeFolderAlreadyExists = 1251,
    IKErrorCodeCannotAddBookmark   = 1252,
    
    // Operational errors
    IKErrorCodeUnexpectedServiceError   = 1500,
    IKErrorCodeErrorGeneratingTextOfURL = 1550
};