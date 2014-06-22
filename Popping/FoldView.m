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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor customBlueColor];
    }
    return self;
}

@end
