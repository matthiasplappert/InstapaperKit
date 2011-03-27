//
//  IKBookmark.h
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


@interface IKBookmark : NSObject {
    NSInteger _bookmarkID;
    NSURL *_URL;
    NSString *_title;
    NSString *_descr;
    NSDate *_date;
    BOOL _starred;
    NSString *_privateSource;
    NSString *_hashString;
    CGFloat _progress;
    NSDate *_progressDate;
}

@property (nonatomic, assign) NSInteger bookmarkID;
@property (nonatomic, retain) NSURL *URL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descr;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, assign, getter=isStarred) BOOL starred;
@property (nonatomic, copy) NSString *privateSource;
@property (nonatomic, copy) NSString *hashString;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, retain) NSDate *progressDate;

+ (IKBookmark *)bookmarkWithBookmarkID:(NSInteger)bookmarkID;
- (id)initWithBookmarkID:(NSInteger)bookmarkID;

@end
