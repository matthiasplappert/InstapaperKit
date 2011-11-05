//
//  TestAppDelegate.m
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

#import "TestAppDelegate.h"

@implementation TestAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Configure engine
    [IKEngine setOAuthConsumerKey:@"your application's consumer key"
                andConsumerSecret:@"your application's consumer secret"];
    
    _engine = [[IKEngine alloc] initWithDelegate:self];
    
    // If you already have an auth token and auth token secret, set them. otherwise,
    // you'll have to request them using the authTokenForUsername:password: method
    _engine.OAuthToken = @"the user's oauth token";
    _engine.OAuthTokenSecret = @"the user's oauth token secret";
    
    //[_engine authTokenForUsername:@"user@domain.com" password:@"shh, secret!" userInfo:nil];
    //[_engine verifyCredentialsWithUserInfo:nil];
    
    //[_engine bookmarksWithUserInfo:nil];
    //[_engine bookmarksInFolder:[IKFolder unreadFolder] limit:10 existingBookmarks:nil userInfo:nil];
    //[_engine updateReadProgressOfBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] toProgress:0.8f userInfo:nil];
    //[_engine addBookmarkWithURL:[NSURL URLWithString:@"http://matthiasplappert.com"] userInfo:nil];
    /*[_engine addBookmarkWithURL:[NSURL URLWithString:@"http://matthiasplappert.com"]
                          title:@"A titel"
                    description:@"A description"
                         folder:[IKFolder folderWithFolderID:672204]
                resolveFinalURL:YES
                       userInfo:nil];*/
    //[_engine deleteBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] userInfo:nil];
    //[_engine starBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] userInfo:nil];
    //[_engine unstarBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] userInfo:nil];
    //[_engine archiveBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] userInfo:nil];
    //[_engine unarchiveBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] userInfo:nil];
    //[_engine moveBookmark:[IKBookmark bookmarkWithBookmarkID:145041527] toFolder:[IKFolder folderWithFolderID:672205] userInfo:nil];
    //[_engine textOfBookmark:[IKBookmark bookmarkWithBookmarkID:144781681] userInfo:nil];
    
    //[_engine foldersWithUserInfo:nil];
    //[_engine addFolderWithTitle:@"Test" userInfo:nil];
    //[_engine deleteFolder:[IKFolder folderWithFolderID:992456] userInfo:nil];
    /*NSArray *folders = [NSArray arrayWithObjects:[IKFolder folderWithFolderID:672204],
                                                 [IKFolder folderWithFolderID:672206],
                                                 [IKFolder folderWithFolderID:672205], nil];
    [_engine orderFolders:folders userInfo:nil];*/
}

- (void)dealloc
{
    [_engine cancelAllConnections];
    [_engine release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark IKEngineDelegate

- (void)engine:(IKEngine *)engine willStartConnection:(IKURLConnection *)connection
{
    NSLog(@"engine %@ will start connection %@", engine, connection);
}

- (void)engine:(IKEngine *)engine didFinishConnection:(IKURLConnection *)connection
{
    NSLog(@"engine %@ did finish connection %@", engine, connection);
}

- (void)engine:(IKEngine *)engine didFailConnection:(IKURLConnection *)connection error:(NSError *)error
{
    NSString *errorMessage = [[error userInfo] objectForKey:IKErrorMessageKey];
    NSLog(@"engine %@ did fail connection %@ error %@ message %@", engine, connection, error, errorMessage);
}

- (void)engine:(IKEngine *)engine didCancelConnection:(IKURLConnection *)connection
{
    NSLog(@"engine %@ did cancel connection %@", engine, connection);
}

#pragma mark -

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didReceiveAuthToken:(NSString *)token andTokenSecret:(NSString *)secret
{
    NSLog(@"engine %@ connection %@ did receive auth token %@ and token secret %@", engine, connection, token, secret);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didVerifyCredentialsForUser:(IKUser *)user
{
    NSLog(@"engine %@ connection %@ did verify credentials for user %@", engine, connection, user);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didReceiveBookmarks:(NSArray *)bookmarks ofUser:(IKUser *)user forFolder:(IKFolder *)folder
{
    NSLog(@"engine %@ connection %@ did receive bookmarks %@ of user %@ for folder %@", engine, connection, bookmarks, user, folder);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didUpdateReadProgressOfBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did update read progress of bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didAddBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did add bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didDeleteBookmarkWithBookmarkID:(NSInteger)bookmarkID;
{
    NSLog(@"engine %@ connection %@ did delete bookmark with bookmark id %ld", engine, connection, bookmarkID);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didStarBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did star bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didUnstarBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did unstar bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didArchiveBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did archive bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didUnarchiveBookmark:(IKBookmark *)bookmark
{
    NSLog(@"engine %@ connection %@ did unarchive bookmark %@", engine, connection, bookmark);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didMoveBookmark:(IKBookmark *)bookmark toFolderWithFolderID:(NSInteger)folderID;
{
    NSLog(@"engine %@ connection %@ did move bookmark %@ to folder with folder id %ld", engine, connection, bookmark, folderID);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didReceiveText:(NSString *)text ofBookmarkWithBookmarkID:(NSInteger)bookmarkID
{
    NSLog(@"engine %@ connection %@ did receive text %@ of bookmark with bookmark id %ld", engine, connection, text, bookmarkID);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didReceiveFolders:(NSArray *)folders
{
    NSLog(@"engine %@ connection %@ did receive folders %@", engine, connection, folders);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didAddFolder:(IKFolder *)folder
{
    NSLog(@"engine %@ connection %@ did add folder %@", engine, connection, folder);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didDeleteFolderWithFolderID:(NSInteger)folderID
{
    NSLog(@"engine %@ connection %@ did delete folder with folder id %ld", engine, connection, folderID);
}

- (void)engine:(IKEngine *)engine connection:(IKURLConnection *)connection didOrderFolders:(NSArray *)folders
{
    NSLog(@"engine %@ connection %@ did order folders %@", engine, connection, folders);
}

@end
