# InstapaperKit

InstapaperKit lets you access the [full Instapaper API](http://www.instapaper.com/api/full). It is
written in Objective-C and works on both platforms, Mac OS X and iOS. InstapaperKit is licensed under
the MIT license.


## Installation

InstapaperKit uses a git submodule. To get the source code and the submodule, do the following:

    git clone git://github.com/matthiasplappert/InstapaperKit.git /some/path/InstapaperKit
    cd /some/path/InstapaperKit/
    git submodule update --init --recursive

The easiest way to use InstapaperKit is top add all classes from the Xcode *InstapaperKit* group to
your own project. The included Xcode project also includes a framework build target, which you can
use on Mac OS X. You should now be able to `#import "InstapaperKit.h"` (if you use the framework
you have to `#import <InstapaperKit/InstapaperKit.h>`).


## Limitations

Instapaper requires a [Subscription account](http://www.instapaper.com/subscription) for most methods.
Exceptions are requesting an auth token, verifying credentials, adding a bookmark, and listing folders.
Fore more information, please read the [Instapaper API documentation](http://www.instapaper.com/api/full).


## Usage

The Instapaper API uses [xAuth](http://dev.twitter.com/pages/xauth). InstapaperKit takes care of
signing your requests and all that nasty stuff. However, you have to configure InstapaperKit properly
before you can use it.


### Providing an OAuth Consumer Key and Secret

Start by setting your OAuth consumer key and secret. If you don’t have those yet, you have to [request
them](http://www.instapaper.com/main/request_oauth_consumer_token).

    [IKEngine setOAuthConsumerKey:@"your application's consumer key"
                andConsumerSecret:@"your application's consumer secret"];

The values you provided are used globally, so every `IKEngine` instance uses them. It is therefore
highly recommended that you do this configuration as soon as your application did finish launching.
Make sure that you keep your OAuth consumer secret, well, secret!


### Requesting an OAuth Token and Secret

xAuth (just like OAuth) doesn’t authenticate users by their username and password but a token and
secret. You therefore should **never** store a user’s password but only the token and secret. You
typically request a token as soon as the user enters his username and password.

    // Assuming that your class has an instance variable _engine
    _engine = [[IKEngine alloc] initWithDelegate:self];
    [_engine authTokenForUsername:@"user@domain.com" password:@"shh, secret!" userInfo:nil];

Once the request is complete, your delegate’s `engine:connection:didReceiveAuthToken:andTokenSecret:`
method will get called:

    - (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didReceiveAuthToken:(NSString *)token andTokenSecret:(NSString *)secret
    {
        // Assign token and secret
        engine.OAuthToken  = token;
        engine.OAuthTokenSecret = secret;

        // Save token and secret in keychain (do not use NSUserDefaults for the secret!)
    }

Make sure to store your token and secret, you don’t want to request the token and secret every time
the application starts. Also make sure to store the secret in a safe place like the keychain.


### The IKEngineDelegate

Once you have properly configured InstapaperKit, you can start using the API. As InstapaperKit
uses asynchronous connections, it makes heavy use of `IKEngineDelegate`.

`IKEngineDelegate` defines 4 general methods: `engine:willStartConnection:`, `engine:didFinishConnection:`,
`engine:didFailConnection:error:`, and `engine:didCancelConnection:`. Those methods get called every
time a connection starts, finishes, fails or is cancelled. You can use `IKURLConnection`s `type`
property to figure out which type of connection you’re dealing with.

`IKEngineDelegate` also defines a couple of delegate method which gets called on a successful request.
Those methods pass the parsed return value of the respective request. Please note that the
`engine:didFinishConnection:` method will always get called, no matter if you implement a specific
success method or not.


### Trying InstapaperKit

The InstapaperKit Xcode project includes the Test target that builds a simple Mac OS X app which
implements all delegate methods and logs the results. Go ahead, give the framework a try!


## Notes
- InstapaperKit uses the names, error codes and defaults introduced by the
[Instapaper API](http://www.instapaper.com/api/full)
- [JSONKit](https://github.com/johnezang/JSONKit) by John Engelhart is used to parse JSON
- [NSData+Base64](http://cocoawithlove.com/2009/06/base64-encoding-options-on-mac-and.html) by
Matt Gallagher is used for base64 encoding
