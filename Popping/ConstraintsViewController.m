//
//  ConstraintsViewController.m
//  Popping
//
//  Created by André Schneider on 19.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ConstraintsViewController.h"

@interface ConstraintsViewController()
- (void)addBarButton;
- (void)updateConstraints:(id)sender;
@end

@implementation ConstraintsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBarButton];
}

#pragma mark - Private Instance methods

- (void)addBarButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Reorder"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(updateConstraints:)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)updateConstraints:(id)sender
{

}

@end
