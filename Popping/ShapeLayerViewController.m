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
- (void)addPasswordTextField;
@end

@implementation ShapeLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPasswordTextField];
}

#pragma mark - Private Interface methods

- (void)addPasswordTextField
{
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];

    UITextField *passwordTextField = [UITextField new];
    passwordTextField.leftView = leftPaddingView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    passwordTextField.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.layer.cornerRadius = 2.f;
    passwordTextField.placeholder = @"Enter a Password";
    [passwordTextField becomeFirstResponder];
    [self.view addSubview:passwordTextField];

    NSDictionary *views = NSDictionaryOfVariableBindings(passwordTextField);

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[passwordTextField]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(88)-[passwordTextField(==36)]"
                               options:0
                               metrics:nil
                               views:views]];
}

@end
