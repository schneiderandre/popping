//
//  PasswordStrengthIndicatorView.m
//  Popping
//
//  Created by André Schneider on 18.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "PasswordStrengthIndicatorView.h"

@interface PasswordStrengthIndicatorView()
- (void)addIndicatorView;
@end

@implementation PasswordStrengthIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.layer.cornerRadius = 2.f;
        [self addIndicatorView];
    }
    return self;
}

#pragma mark - Private Instance methods

- (void)addIndicatorView
{
    UIView *indicatorView = [UIView new];
    indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.layer.cornerRadius = self.layer.cornerRadius;
    [self addSubview:indicatorView];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.f
                                                      constant:0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.0f
                                                      constant:0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.f
                                                      constant:0.f]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.f
                                                      constant:0.f]];
}

@end
