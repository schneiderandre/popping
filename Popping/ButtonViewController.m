//
//  ButtonViewController.m
//  Popping
//
//  Created by André Schneider on 10.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ButtonViewController.h"
#import "FlatButton.h"
#import "UIColor+CustomColors.h"
#import <POP/POP.h>

@interface ButtonViewController()
@property (nonatomic) UILabel *errorLabel;
@property (nonatomic) FlatButton *button;
@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;

- (void)addButton;
- (void)addLabel;
- (void)addActivityIndicatorView;
- (void)showLabel;
- (void)hideLabel;
- (void)shakeButton;
@end

@implementation ButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    [self addLabel];
    [self addActivityIndicatorView];
}

#pragma mark - Private Instance methods

- (void)addButton
{
    self.button = [FlatButton button];
    self.button.backgroundColor = [UIColor customBlueColor];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Log in" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
}

- (void)addLabel
{
    self.errorLabel = [UILabel new];
    self.errorLabel.font = [UIFont fontWithName:@"Avenir-Light" size:18];
    self.errorLabel.textColor = [UIColor customRedColor];
    self.errorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.errorLabel.text = @"Just a serious login error.";
    self.errorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view insertSubview:self.errorLabel belowSubview:self.button];

    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLabel
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.button
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1
                              constant:0.f]];

    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLabel
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual toItem:self.button
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1
                              constant:self.button.intrinsicContentSize.height]];

    self.errorLabel.layer.opacity = 0.0;
}

- (void)addActivityIndicatorView
{
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)touchUpInside:(FlatButton *)button
{
    [self hideLabel];
    [self.activityIndicatorView startAnimating];
    button.userInteractionEnabled = NO;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.activityIndicatorView stopAnimating];
        [self shakeButton];
        [self showLabel];
    });
}

#pragma mark Animations

- (void)shakeButton
{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        self.button.userInteractionEnabled = YES;
    }];
    [self.button.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

- (void)showLabel
{
    self.errorLabel.layer.opacity = 1.0;
    POPSpringAnimation *layerScaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.springBounciness = 18;
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"labelScaleAnimation"];

    POPSpringAnimation *layerPositionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y + self.button.intrinsicContentSize.height);
    layerPositionAnimation.springBounciness = 12;
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}

- (void)hideLabel
{
    POPBasicAnimation *layerScaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
    [self.errorLabel.layer pop_addAnimation:layerScaleAnimation forKey:@"layerScaleAnimation"];

    POPBasicAnimation *layerPositionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.button.layer.position.y);
    [self.errorLabel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}

@end
