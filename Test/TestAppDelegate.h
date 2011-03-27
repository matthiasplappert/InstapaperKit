//
//  TestAppDelegate.h
//  Test
//
//  Created by Matthias Plappert on 3/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <InstapaperKit/InstapaperKit.h>


@interface TestAppDelegate : NSObject <NSApplicationDelegate, IKEngineDelegate> {
@private
    IKEngine *_engine;
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
