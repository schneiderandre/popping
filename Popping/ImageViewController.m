//
//  ImageViewController.m
//  Popping
//
//  Created by André Schneider on 11.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ImageViewController.h"
#import <POP/POP.h>
#import "UIColor+CustomColors.h"
#import "ImageView.h"

typedef struct {
    CGFloat progress;
    CGFloat toValue;
    CGFloat currentValue;
} AnimationInfo;

@interface ImageViewController()
- (void)addImageView;
- (void)touchDown:(UIControl *)sender;
- (void)touchUpInside:(UIControl *)sender;
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void)scaleDownView:(UIView *)view;
- (void)scaleUpView:(UIView *)view;
- (void)pauseAllAnimations:(BOOL)pause forLayer:(CALayer *)layer;
- (AnimationInfo)animationInfoForLayer:(CALayer *)layer;
@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addImageView];
}

#pragma mark - Private Instance methods

- (void)addImageView
{
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];

    CGFloat width = CGRectGetWidth(self.view.bounds) - 20.f;
    CGFloat height = roundf(width*0.75f);
    ImageView *imageView = [[ImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    imageView.center = self.view.center;
    [imageView setImage:[UIImage imageNamed:@"boat.jpg"]];
    [imageView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [imageView addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addGestureRecognizer:recognizer];

    [self.view addSubview:imageView];
    [self scaleDownView:imageView];
}

- (void)touchDown:(UIControl *)sender {
    [self pauseAllAnimations:YES forLayer:sender.layer];
}

- (void)touchUpInside:(UIControl *)sender {
    AnimationInfo animationInfo = [self animationInfoForLayer:sender.layer];
    BOOL hasAnimations = sender.layer.pop_animationKeys.count;

    if (hasAnimations && animationInfo.progress < 0.98) {
        [self pauseAllAnimations:NO forLayer:sender.layer];
        return;
    }

    [sender.layer pop_removeAllAnimations];
    if (animationInfo.toValue == 1 || sender.layer.affineTransform.a == 1) {
        [self scaleDownView:sender];
        return;
    }
    [self scaleUpView:sender];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    [self scaleDownView:recognizer.view];
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

-(void)scaleUpView:(UIView *)view
{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
    [view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];

    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    scaleAnimation.springBounciness = 10.f;
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (void)scaleDownView:(UIView *)view
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    scaleAnimation.springBounciness = 10.f;
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (void)pauseAllAnimations:(BOOL)pause forLayer:(CALayer *)layer
{
    for (NSString *key in layer.pop_animationKeys) {
        POPAnimation *animation = [layer pop_animationForKey:key];
        [animation setPaused:pause];
    }
}

- (AnimationInfo)animationInfoForLayer:(CALayer *)layer
{
    POPSpringAnimation *animation = [layer pop_animationForKey:@"scaleAnimation"];
    CGPoint toValue = [animation.toValue CGPointValue];
    CGPoint currentValue = [[animation valueForKey:@"currentValue"] CGPointValue];
    
    CGFloat min = MIN(toValue.x, currentValue.x);
    CGFloat max = MAX(toValue.x, currentValue.x);

    AnimationInfo info;
    info.toValue = toValue.x;
    info.currentValue = currentValue.x;
    info.progress = min / max;
    return info;
}

@end
