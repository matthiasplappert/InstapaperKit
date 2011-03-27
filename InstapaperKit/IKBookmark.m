//
//  IKBookmark.m
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IKBookmark.h"


@implementation IKBookmark

@synthesize bookmarkID = _bookmarkID, URL = _URL, title = _title, descr = _descr, date = _date,
            starred = _starred, privateSource = _privateSource, hashString = _hashString,
            progress = _progress, progressDate = _progressDate;

+ (IKBookmark *)bookmarkWithBookmarkID:(NSInteger)bookmarkID
{
    IKBookmark *bookmark = [[[IKBookmark alloc] initWithBookmarkID:bookmarkID] autorelease];
    return bookmark;
}

- (id)init
{
    return [self initWithBookmarkID:NSNotFound];
}

- (id)initWithBookmarkID:(NSInteger)bookmarkID
{
    if ((self = [super init])) {
        _bookmarkID    = bookmarkID;
        _URL           = nil;
        _title         = nil;
        _descr         = nil;
        _date          = nil;
        _starred       = NO;
        _privateSource = nil;
        _hashString    = nil;
        _progress      = -1.0f;
        _progressDate  = nil;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@ (%d), URL:(%@)>", NSStringFromClass([self class]),
                                                                  self.title,
                                                                  self.bookmarkID,
                                                                  self.URL];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_URL release];
    [_title release];
    [_descr release];
    [_date release];
    [_privateSource release];
    [_hashString release];
    [_progressDate release];
    
    [super dealloc];
}

@end
