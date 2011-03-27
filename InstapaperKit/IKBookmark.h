//
//  IKBookmark.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
