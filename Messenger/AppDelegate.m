//
//  AppDelegate.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/27/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    [[DATACENTER messengerWindowController] showWindow:self];
    return YES;
}

- (IBAction)reloadAction:(id)sender {
    [[DATACENTER messengerViewController] reload];
}

- (IBAction)clearDataAction:(id)sender {
    [[DATACENTER messengerViewController] clearData];
}
@end
