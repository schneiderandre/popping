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
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.view.userInteractionEnabled = NO;

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [transitionContext.containerView addSubview:toVC.view];
    NSDictionary *view = @{@"toView" : toVC.view};

    [transitionContext.containerView addConstraints:[NSLayoutConstraint
                                                     constraintsWithVisualFormat:@"H:|-24-[toView]-24-|"
                                                     options:0
                                                     metrics:nil
                                                     views:view]];

    [transitionContext.containerView addConstraints:[NSLayoutConstraint
                                                     constraintsWithVisualFormat:@"V:|-104-[toView]-104-|"
                                                     options:0
                                                     metrics:nil
                                                     views:view]];

    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    CGPoint fromPosition = CGPointMake(toVC.view.layer.position.x,
                                       -CGRectGetHeight(toVC.view.bounds)/2);
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPosition];
    positionAnimation.springBounciness = 10;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

    [toVC.view.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

@end
