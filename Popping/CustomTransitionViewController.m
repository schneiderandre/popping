//
//  CustomTransitionViewController.m
//  Popping
//
//  Created by André Schneider on 14.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "CustomTransitionViewController.h"
#import "PopAnimator.h"

@interface CustomTransitionViewController() <UIViewControllerTransitioningDelegate>

@end

@implementation CustomTransitionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Custom Transition";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    UIViewController *modalViewController = [UIViewController new];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    modalViewController.view.layer.cornerRadius = 8.f;
    modalViewController.view.backgroundColor = [UIColor colorWithRed:46/255.f
                                                               green:204/255.f
                                                                blue:113/255.f
                                                               alpha:1.000];

    [self.navigationController presentViewController:modalViewController
                                            animated:YES
                                          completion:NULL];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PopAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [PopAnimator new];
}

@end
