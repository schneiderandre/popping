//
//  PaperButtonViewController.m
//  Popping
//
//  Created by André Schneider on 12.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "PaperButtonViewController.h"
#import "PaperButton.h"
#import <POP/POP.h>

@interface PaperButtonViewController()
@property(nonatomic) UILabel *titleLabel;
- (void)addControls;
- (void)animateTitleLabel:(id)sender;
- (void)setTitleLabel;
@end

@implementation PaperButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Paper Button Animation";
    self.view.backgroundColor = [UIColor whiteColor];

    [self addControls];
}

# pragma mark - Private Instance methods

- (void)addControls
{
    CGPoint origin = CGPointMake(CGRectGetWidth(self.view.frame) - 56.f, 72.f);

    PaperButton *button = [PaperButton buttonWithOrigin:origin];
    [button addTarget:self action:@selector(animateTitleLabel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    CGFloat titlePadding = 20.f;
    CGRect titleFrame = CGRectMake(titlePadding,
                                   origin.y,
                                   CGRectGetMinX(button.frame) - titlePadding*2,
                                   CGRectGetHeight(button.bounds));

    self.titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.f];
    [self setTitleLabel];
    [self.view addSubview:self.titleLabel];
}

- (void)animateTitleLabel:(id)sender
{
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(self.titleLabel.center.x);
    onscreenAnimation.springBounciness = 10.f;

    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-self.titleLabel.layer.position.y);
    offscreenAnimation.duration = 0.2f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self setTitleLabel];
        [self.titleLabel.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
    }];
    [self.titleLabel.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)setTitleLabel
{
    NSString *title = @"List";
    if ([self.titleLabel.text isEqualToString:title]) {
        title = @"Menu";
    }
    self.titleLabel.text = title;
}

@end
