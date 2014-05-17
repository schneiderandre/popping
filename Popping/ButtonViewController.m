//
//  ButtonViewController.m
//  Popping
//
//  Created by André Schneider on 10.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ButtonViewController.h"
#import "FlatButton.h"

@implementation ButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Button Animation";
    self.view.backgroundColor = [UIColor whiteColor];

    FlatButton *flatButton = [FlatButton button];
    flatButton.translatesAutoresizingMaskIntoConstraints = NO;
    [flatButton setTitle:@"Touch me" forState:UIControlStateNormal];
    [self.view addSubview:flatButton];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flatButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:flatButton
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
}

@end
