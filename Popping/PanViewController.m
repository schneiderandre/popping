//
//  PanViewController.m
//  Popping
//
//  Created by André Schneider on 11.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "PanViewController.h"
#import <POP/POP.h>

@implementation PanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];

    UIControl *panView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    panView.center = self.view.center;
    panView.layer.cornerRadius = CGRectGetWidth(panView.frame)/2;
    panView.backgroundColor = [UIColor colorWithRed:46/255.f
                                              green:204/255.f
                                               blue:113/255.f
                                              alpha:1.000];

    [panView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [panView addGestureRecognizer:recognizer];

    [self.view addSubview:panView];
}

- (void)touchDown:(UIControl *)sender {
    [sender.layer pop_removeAllAnimations];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];

    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];

        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        positionAnimation.dynamicsTension = 10.f;
        positionAnimation.dynamicsFriction = 1.0f;
        positionAnimation.springBounciness = 12.0f;
        [recognizer.view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}

@end
