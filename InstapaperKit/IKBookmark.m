//
//  IKBookmark.m
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
    return [NSString stringWithFormat:@"<%@: %@ (%ld), URL:(%@)>", NSStringFromClass([self class]),
                                                                  self.title,
                                                                  (long)self.bookmarkID,
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
