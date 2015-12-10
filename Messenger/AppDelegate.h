//
//  AppDelegate.h
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/27/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataCenter.h"

@class MessengerViewController, MessengerWindowController, DownloadViewController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (IBAction)reloadAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)clearDataAction:(id)sender;

@end

