//
//  PopAnimator.m
//  Popping
//
//  Created by André Schneider on 14.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "PresentingAnimator.h"
#import <POP/POP.h>

@implementation PresentingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.userInteractionEnabled = NO;

    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) - 104.f,
                              CGRectGetHeight(transitionContext.containerView.bounds) - 288.f);
    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    [transitionContext.containerView addSubview:toView];

    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(transitionContext.containerView.center.y);
    positionAnimation.springBounciness = 10;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

@end
