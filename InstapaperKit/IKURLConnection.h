//
//  IKURLConnection.h
//  Instapaper
//
//  Created by Matthias Plappert on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKURLConnection : NSURLConnection {
    NSURLRequest *_request;
    NSHTTPURLResponse *_response;
    NSMutableData *_data;
    id _userInfo;
    
    NSInteger _type;
    id _context;
}

@property (nonatomic, readonly) NSURLRequest *request;
@property (nonatomic, readonly) NSHTTPURLResponse *response;
@property (nonatomic, readonly) NSData *data;
@property (nonatomic, readonly) id userInfo;

@end
