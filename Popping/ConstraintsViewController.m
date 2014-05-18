//
//  ConstraintsViewController.m
//  Popping
//
//  Created by André Schneider on 18.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ConstraintsViewController.h"

@interface ConstraintsViewController()
@property(nonatomic) UIView *redView;
@property(nonatomic) UIView *greenView;
@property(nonatomic) UIView *blueView;
- (void)addBarButton;
- (void)reorderViews:(id)sender;
@end

@implementation ConstraintsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBarButton];
}

#pragma mark - Private Instance methods

- (void)reorderViews:(id)sender
{

}

- (void)addBarButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Reorder"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(reorderViews:)];
    self.navigationItem.rightBarButtonItem = item;
}

@end
