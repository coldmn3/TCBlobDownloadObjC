//
//  UAViewController.m
//  TCBlobDownloadObjC
//
//  Created by UnlimApps Inc on 12/04/2015.
//  Copyright (c) 2015 UnlimApps Inc. All rights reserved.
//

#import "UAViewController.h"
#import <TCBlobDownloadManager.h>

@interface UAViewController ()
@property (nonatomic, strong) TCBlobDownloadManager *manager;
@end

@implementation UAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.manager = [[TCBlobDownloadManager alloc] init];
    self.manager.startImmediatly = YES;
    [self.manager downloadFileAtURL:[NSURL URLWithString:@"https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/HT1425/sample_iTunes.mov.zip"]
                   toDirectory:[NSURL fileURLWithPath:NSTemporaryDirectory()]
                           withName:@"someFile.zip"
                      progress:^(double progress, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
                          NSLog(@"progress: %f", progress);
                      }
                    completion:^(NSError *error, NSURL *location) {
                        NSLog(@"File at: %@", location);
                    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
