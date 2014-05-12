//
//  PaperButtonViewController.m
//  Popping
//
//  Created by André Schneider on 12.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "PaperButtonViewController.h"
#import "PaperButton.h"

@interface PaperButtonViewController ()

@end

@implementation PaperButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Paper Button Animation";
    self.view.backgroundColor = [UIColor whiteColor];

    CGPoint origin = CGPointMake(CGRectGetWidth(self.view.frame) - 40.f, 80.f);

    PaperButton *button = [PaperButton buttonWithOrigin:origin];
    [self.view addSubview:button];
}

@end
