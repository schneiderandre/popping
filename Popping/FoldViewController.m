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
@property(nonatomic) FoldView *foldView;
@end

@implementation FoldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self addFoldView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.foldView poke];
}

#pragma mark - Private instance methods

- (void)addFoldView
{
    CGFloat padding = 30.f;
    CGFloat width = CGRectGetWidth(self.view.bounds) - padding * 2;
    CGRect frame = CGRectMake(0, 0, width, width);

    self.foldView = [[FoldView alloc] initWithFrame:frame
                                                   image:[UIImage imageNamed:@"boat.jpg"]];
    self.foldView.center = self.view.center;
    [self.view addSubview:self.foldView];
}

@end
