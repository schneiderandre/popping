//
//  ShapeLayerViewController.m
//  Popping
//
//  Created by André Schneider on 18.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ShapeLayerViewController.h"
#import "PasswordStrengthIndicatorView.h"

@interface ShapeLayerViewController()
@property(nonatomic) UITextField *passwordTextField;
@property(nonatomic) PasswordStrengthIndicatorView *passwordStrengthIndicatorView;
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
    self.passwordStrengthIndicatorView = [PasswordStrengthIndicatorView new];
    [self.view addSubview:self.passwordStrengthIndicatorView];

    NSDictionary *views = NSDictionaryOfVariableBindings(_passwordTextField, _passwordStrengthIndicatorView);

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_passwordStrengthIndicatorView]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[_passwordTextField]-[_passwordStrengthIndicatorView(==10)]"
                               options:0
                               metrics:nil
                               views:views]];
}

@end
