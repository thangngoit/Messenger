//
//  DataCenter.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/30/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

#pragma mark Singleton Methods

+ (id)sharedData {
    static DataCenter *sharedData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedData = [[self alloc] init];
    });
    return sharedData;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
