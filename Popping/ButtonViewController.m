//
//  ButtonViewController.m
//  Popping
//
//  Created by André Schneider on 10.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ButtonViewController.h"
#import <POP/POP.h>

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Button Animation";
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    button.frame = CGRectMake(0.f, 0.f, 140.f, 48.f);
    button.center = self.view.center;

    button.backgroundColor = [UIColor colorWithRed:46/255.f
                                             green:204/255.f
                                              blue:113/255.f
                                             alpha:1.000];
    button.layer.cornerRadius = 4.f;
    [button setTitle:@"Touch me"
            forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium"
                                             size:22];

    [button addTarget:self action:@selector(buttonTouchDown:)
     forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [button addTarget:self action:@selector(buttonTouchUpInside:)
     forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(buttonTouchCancel:)
     forControlEvents:UIControlEventTouchDragExit];

    [self.view addSubview:button];
}

- (void)buttonTouchDown:(UIButton *)sender
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [sender.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}

- (void)buttonTouchUpInside:(UIButton *)sender
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(4.f, 4.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [sender.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}

- (void)buttonTouchCancel:(UIButton *)sender
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [sender.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}

@end
