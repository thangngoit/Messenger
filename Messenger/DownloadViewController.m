//
//  DownloadViewController.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/30/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "DownloadViewController.h"

@interface DownloadViewController ()

@end

@implementation DownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)downloadAction:(id)sender {
    FilesDownloader *filesDownloader = [FilesDownloader new];
    [filesDownloader startDownloadURL:[DATACENTER currentURLToDownload]];
}

- (IBAction)closeAction:(id)sender {
    if (self.presentingViewController) {
        [self.presentingViewController dismissViewController:self];
    }
}
@end
