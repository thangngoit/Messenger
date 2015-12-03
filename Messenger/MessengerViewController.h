//
//  ViewController.h
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/27/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "DataCenter.h"

@interface MessengerViewController : NSViewController <WebUIDelegate, WebFrameLoadDelegate, WebPolicyDelegate, WKNavigationDelegate, WebEditingDelegate>

@property (strong, nonatomic) NSURLRequest *defaultURLRequest;
@property (weak) IBOutlet WebView *messengerWebView;
@property (weak) IBOutlet NSProgressIndicator *indicator;

- (void)openURL:(NSURL*) url;
- (void)reload;

@end


