//
//  FoldView.m
//  Popping
//
//  Created by André Schneider on 22.06.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "FoldView.h"
#import "UIColor+CustomColors.h"
#import <POP/POP.h>

typedef NS_ENUM(NSInteger, LayerSection) {
    LayerSectionTop,
    LayerSectionBottom
};

@interface FoldView()
- (void)addTopView;
- (void)addBottomView;
- (void)addGestureRecognizer;
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (UIImage *)imageForSection:(LayerSection)section withImage:(UIImage *)image;
- (void)rotateToOrigin;

@property(nonatomic) UIImage *image;
@property(nonatomic) UIImageView *topView;
@end

@implementation FoldView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        _image = image;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;

        [self addBottomView];
        [self addTopView];

        [self addGestureRecognizer];
    }
    return self;
}

#pragma mark - Private Instance methods

- (void)addTopView
{
    UIImage *image = [self imageForSection:LayerSectionTop withImage:self.image];

    self.topView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f,
                                                                 0.f,
                                                                 CGRectGetWidth(self.bounds),
                                                                 CGRectGetMidY(self.bounds))];
    self.topView.image = image;
    self.topView.layer.anchorPoint = CGPointMake(0.5, 1.0);
    self.topView.layer.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    self.topView.userInteractionEnabled = YES;
    self.topView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.topView];
}

- (void)addBottomView
{
    UIImage *image = [self imageForSection:LayerSectionBottom withImage:self.image];

    UIImageView *bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f,
                                                                            CGRectGetMidY(self.bounds),
                                                                            CGRectGetWidth(self.bounds),
                                                                            CGRectGetMidY(self.bounds))];
    bottomView.image = image;
    bottomView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:bottomView];
}

- (void)addGestureRecognizer
{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handlePan:)];
    [self.topView addGestureRecognizer:panGestureRecognizer];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self];

    if ((location.x > 0 && location.x < CGRectGetWidth(self.bounds)) &&
        (location.y > 0 && location.y < CGRectGetHeight(self.bounds))) {
        CGFloat conversionFactor = -M_PI / CGRectGetHeight(self.bounds);
        POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];

        rotationAnimation.duration = 0.01;
        rotationAnimation.toValue = @(location.y*conversionFactor);
        [self.topView.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    } else {
        recognizer.enabled = NO;
        recognizer.enabled = YES;
    }

    if (recognizer.state == UIGestureRecognizerStateEnded ||
        recognizer.state == UIGestureRecognizerStateCancelled) {
        [self rotateToOrigin];
    }
}

- (void)rotateToOrigin
{
    POPSpringAnimation *rotationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    rotationAnimation.springBounciness = 18.0f;
    rotationAnimation.dynamicsMass = 2.0f;
    rotationAnimation.dynamicsTension = 200;
    rotationAnimation.toValue = @(0);
    rotationAnimation.delegate = self;
    [self.topView.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (UIImage *)imageForSection:(LayerSection)section withImage:(UIImage *)image
{
    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height / 2.f);
    if (section == LayerSectionBottom) {
        rect.origin.y = image.size.height / 2.f;
    }

    CGImageRef imgRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *imagePart = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);

    return imagePart;
}

@end
