//
//  IKURLConnection.m
//  Instapaper
//
//  Created by Matthias Plappert on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IKURLConnection.h"
#import "IKURLConnection+Private.h"


@implementation IKURLConnection

@synthesize request = _request, response = _response, data = _data, userInfo = _userInfo;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
    if ((self = [super initWithRequest:request delegate:delegate startImmediately:startImmediately])) {
        // Initial values
        _request  = [request retain];
        _response = nil;
        _data     = [[NSMutableData alloc] init];
        _userInfo = nil;
        
        _type    = IKURLConnectionTypeUnknown;
        _context = nil;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSData *)data
{
    return [NSData dataWithData:_data];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_request release];
    [_response release];
    [_data release];
    [_userInfo release];
    
    [_context release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Private accessors

- (void)_appendData:(NSData *)data
{
    [_data appendData:data];
}

- (void)_setUserInfo:(id)userInfo
{
    if (_userInfo != userInfo) {
        [_userInfo release];
        _userInfo = [userInfo retain];
    }
}

- (void)_setResponse:(NSHTTPURLResponse *)response
{
    if (_response != response) {
        [_response release];
        _response = [response retain];
    }
}

- (void)_setType:(IKURLConnectionType)type
{
    if (_type != type) {
        _type = type;
    }
}

- (IKURLConnectionType)_type
{
    return _type;
}

- (void)_setContext:(id)context
{
    if (_context != context) {
        [_context release];
        _context = [context retain];
    }
}

- (id)_context
{
    return _context;
}

@end
