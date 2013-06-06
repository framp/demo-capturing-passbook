//
//  DPBViewController.m
//  demo-capturing-passbook
//
//  Created by Federico Rampazzo on 6/6/13.
//  Copyright (c) 2013 Federico Rampazzo. All rights reserved.
//

#import "DPBViewController.h"
#import "PassKit/PassKit.h"
#import "UIView+Additions.h"

@interface DPBViewController ()

@end

@implementation DPBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"columbus" ofType:@"pkpass"];
    PKPass *pass = [[PKPass alloc] initWithData:[NSData dataWithContentsOfFile:filePath] error:nil];
    
    PKAddPassesViewController *pkAddPassesViewController = [[PKAddPassesViewController alloc] initWithPass:pass];
    [self presentViewController:pkAddPassesViewController animated:YES completion:^(){
        UIImage *image = [pkAddPassesViewController.view captureView];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self.view addSubview:imageView];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
