//
//  CircleViewController.m
//  Popping
//
//  Created by André Schneider on 21.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"
#import "UIColor+CustomColors.h"

@interface CircleViewController()
@property(nonatomic) CircleView *circleView;
- (void)addCircleView;
- (void)addSlider;
- (void)sliderChanged:(UISlider *)slider;
@end

@implementation CircleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCircleView];
    [self addSlider];
}

#pragma mark - Private Instance methods

- (void)addCircleView
{
    CGRect frame = CGRectMake(0.f, 0.f, 200.f, 200.f);
    self.circleView = [[CircleView alloc] initWithFrame:frame];
    self.circleView.strokeColor = [UIColor customBlueColor];
    self.circleView.center = self.view.center;

    [self.view addSubview:self.circleView];
}

- (void)addSlider
{
    UISlider *slider = [UISlider new];
    slider.value = 0.7f;
    slider.tintColor = [UIColor customBlueColor];
    slider.translatesAutoresizingMaskIntoConstraints = NO;
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    NSDictionary *views = NSDictionaryOfVariableBindings(slider, _circleView);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_circleView]-(40)-[slider]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[slider]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.circleView setStrokeEnd:slider.value animated:NO];
}

- (void)sliderChanged:(UISlider *)slider
{
    [self.circleView setStrokeEnd:slider.value animated:YES];
}

@end
