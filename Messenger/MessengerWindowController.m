//
//  MessengerWindowController.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/30/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "MessengerWindowController.h"

@interface MessengerWindowController ()

@end

@implementation MessengerWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [DATACENTER setMessengerWindowController:self];
}

@end
