//
//  IKDeserializer.h
//  InstapaperKit
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKDeserializer : NSObject

+ (BOOL)token:(NSString **)token andTokenSecret:(NSString **)secret fromQlineString:(NSString *)qlineString;
+ (id)objectFromJSONString:(NSString *)JSONString;

@end
