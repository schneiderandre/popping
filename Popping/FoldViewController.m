//
//  FoldViewController.m
//  Popping
//
//  Created by André Schneider on 20.06.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "FoldViewController.h"
#import "FoldView.h"

@interface FoldViewController()
- (void)addFoldView;
@end

@implementation FoldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self addFoldView];
}

#pragma mark - Private instance methods

- (void)addFoldView
{
    CGFloat padding = 30.f;
    CGFloat width = CGRectGetWidth(self.view.bounds) - padding * 2;
    CGRect frame = CGRectMake(0, 0, width, width);

    FoldView *foldView = [[FoldView alloc] initWithFrame:frame];
    foldView.center = self.view.center;
    [self.view addSubview:foldView];
}

@end
