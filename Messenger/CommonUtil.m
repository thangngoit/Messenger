//
//  CommonUtil.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 12/3/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil


+ (void)clearData {
    NSAlert *alert = [NSAlert new];
    [alert setMessageText:@"Do you want to clear Messenger Data?"];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"Cancel"];
    
    if ([alert runModal] == NSAlertFirstButtonReturn) {
        NSHTTPCookie *cookie;
        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (cookie in [cookieJar cookies]) {
            [cookieJar deleteCookie:cookie];
        }
        
        [[DATACENTER messengerViewController] reload];
    }
}

@end
