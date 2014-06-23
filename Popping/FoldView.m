//
//  FoldView.m
//  Popping
//
//  Created by André Schneider on 22.06.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "FoldView.h"
#import "UIColor+CustomColors.h"

@implementation FoldView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = image;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
    }
    return self;
}

@end
