//
//  IKURLConnection.m
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

#import "IKURLConnection.h"
#import "IKURLConnection+Private.h"


@implementation IKURLConnection

@synthesize request = _request, response = _response, data = _data, userInfo = _userInfo, type = _type;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
    if ((self = [super initWithRequest:request delegate:delegate startImmediately:startImmediately])) {
        // Initial values
        _request  = [request retain];
        _response = nil;
        _data     = [[NSMutableData alloc] init];
        _userInfo = nil;
        _type     = IKURLConnectionTypeUnknown;
        
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
