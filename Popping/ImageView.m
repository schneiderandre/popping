//
//  ImageView.m
//  Popping
//
//  Created by André Schneider on 25.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ImageView.h"

@interface ImageView()
@property(nonatomic) UIImageView *imageView;
@end

@implementation ImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;

        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return self;
}

#pragma mark - Property Setters

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
    _image = image;
}

@end
