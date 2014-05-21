//
//  CircleViewController.m
//  Popping
//
//  Created by André Schneider on 21.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"

@interface CircleViewController()
- (void)addCircleView;
@end

@implementation CircleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCircleView];
}

#pragma mark - Circle View Controller

- (void)addCircleView
{
    CGRect frame = CGRectMake(0.f, 0.f, 200.f, 200.f);
    CircleView *circleView = [[CircleView alloc] initWithFrame:frame];
    circleView.center = self.view.center;

    [self.view addSubview:circleView];
}

@end
