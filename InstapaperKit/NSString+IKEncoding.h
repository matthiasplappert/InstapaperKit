//
//  NSString+IKEncoding.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (IKEncoding)

- (NSString *)URLEncodedStringUsingEncoding:(NSStringEncoding)stringEncoding;

@end
