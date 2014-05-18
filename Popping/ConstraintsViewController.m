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
- (void)addViews;
- (void)reorderViews:(id)sender;
@end

@implementation ConstraintsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBarButton];
    [self addViews];
}

#pragma mark - Private Instance methods

- (void)reorderViews:(id)sender
{

}

- (void)addViews
{
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueView = [UIView new];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];

    NSDictionary *views = NSDictionaryOfVariableBindings(_redView, _greenView, _blueView);
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_redView]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_greenView]-[_blueView(==_greenView)]-|"
                               options:NSLayoutFormatAlignAllTop
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(88)-[_redView]-[_greenView(==_redView)]-|"
                               options:0
                               metrics:nil
                               views:views]];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(88)-[_redView]-[_blueView(==_redView)]-|"
                               options:0
                               metrics:nil
                               views:views]];
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
