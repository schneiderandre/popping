//
//  ShapeLayerViewController.m
//  Popping
//
//  Created by André Schneider on 18.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ShapeLayerViewController.h"

@interface ShapeLayerViewController()
@property(nonatomic) UITextField *passwordTextField;
@property(nonatomic) UIView *passwordStrengthView;
- (void)addPasswordTextField;
- (void)addPasswordStrengthView;
@end

@implementation ShapeLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPasswordTextField];
    [self addPasswordStrengthView];
}

#pragma mark - Private Interface methods

- (void)addPasswordTextField
{
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];

    self.passwordTextField = [UITextField new];
    self.passwordTextField.leftView = leftPaddingView;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordTextField.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.layer.cornerRadius = 2.f;
    self.passwordTextField.placeholder = @"Enter a Password";
    [self.passwordTextField becomeFirstResponder];
    [self.view addSubview:self.passwordTextField];

    NSDictionary *views = NSDictionaryOfVariableBindings(_passwordTextField);

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_passwordTextField]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(88)-[_passwordTextField(==36)]"
                               options:0
                               metrics:nil
                               views:views]];
}

- (void)addPasswordStrengthView
{
    self.passwordStrengthView = [UIView new];
    self.passwordStrengthView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
    self.passwordStrengthView.translatesAutoresizingMaskIntoConstraints = NO;
    self.passwordStrengthView.layer.cornerRadius = 2.f;
    [self.view addSubview:self.passwordStrengthView];

    UIView *indicatorView = [UIView new];
    indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.layer.cornerRadius = self.passwordStrengthView.layer.cornerRadius;
    [self.passwordStrengthView addSubview:indicatorView];


    [self.passwordStrengthView addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.passwordStrengthView
                                                                          attribute:NSLayoutAttributeHeight
                                                                         multiplier:1.f
                                                                           constant:0]];

    [self.passwordStrengthView addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.passwordStrengthView
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:0.0f
                                                                           constant:0]];

    [self.passwordStrengthView addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.passwordStrengthView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:0.f]];

    [self.passwordStrengthView addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.passwordStrengthView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.f
                                                           constant:0.f]];


    NSDictionary *views = NSDictionaryOfVariableBindings(_passwordTextField, _passwordStrengthView);

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_passwordStrengthView]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[_passwordTextField]-[_passwordStrengthView(==10)]"
                               options:0
                               metrics:nil
                               views:views]];
}

@end
