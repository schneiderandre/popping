//
//  CircleView.m
//  Popping
//
//  Created by André Schneider on 21.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()
- (void)addCircleLayer;
@end

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(frame.size.width == frame.size.height, @"A circle must have the same height and width.");
        [self addCircleLayer];
    }
    return self;
}

#pragma mark - Private Instance methods

- (void)addCircleLayer
{
    CGFloat lineWidth = 10.f;
    CGFloat radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2;
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    CGRect rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2);
    circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                  cornerRadius:radius].CGPath;

    circleLayer.strokeColor = [UIColor colorWithRed:46/255.f
                                              green:204/255.f
                                               blue:113/255.f
                                              alpha:1.000].CGColor;
    circleLayer.fillColor = nil;
    circleLayer.lineWidth = lineWidth;
    circleLayer.strokeEnd = 1.f;
    circleLayer.lineCap = kCALineCapRound;
    circleLayer.lineJoin = kCALineJoinRound;

    [self.layer addSublayer:circleLayer];
}

@end
