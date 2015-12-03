//
//  DataCenter.h
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/30/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Constant.h"
#import "CommonUtil.h"
#import "MessengerViewController.h"
#import "MessengerWindowController.h"

@interface DataCenter : NSObject

@property (strong, nonatomic) MessengerWindowController *messengerWindowController;
@property (strong, nonatomic) MessengerViewController   *messengerViewController;

+ (id)sharedData;

@end
