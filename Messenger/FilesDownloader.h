//
//  FilesDownloader.h
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/30/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataCenter.h"

typedef void (^CompletionHandlerType)();

@interface FilesDownloader : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate>

@property NSURLSession *backgroundSession;
@property NSURLSession *defaultSession;
@property NSURLSession *ephemeralSession;

- (void)createSession;
- (void)startDownloadURL:(NSURL*)url;

//- (void) addCompletionHandler: (CompletionHandlerType) handler forSession: (NSString *)identifier;
//- (void) callCompletionHandlerForSession: (NSString *)identifier;

@end
