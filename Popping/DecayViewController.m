//
//  DecayViewController.m
//  Popping
//
//  Created by André Schneider on 22.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "DecayViewController.h"
#import <POP/POP.h>

@interface DecayViewController()
- (void)addDragView;
- (void)touchDown:(UIControl *)sender;
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
@end

@implementation DecayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addDragView];
}

#pragma mark - Private Instance methods

- (void)addDragView
{
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];

    UIControl *dragView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    dragView.center = self.view.center;
    dragView.backgroundColor = [UIColor colorWithRed:46/255.f
                                              green:204/255.f
                                               blue:113/255.f
                                              alpha:1.000];

    [dragView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [dragView addGestureRecognizer:recognizer];

    [self.view addSubview:dragView];
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
        POPDecayAnimation *positionAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [recognizer.view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}

@end
