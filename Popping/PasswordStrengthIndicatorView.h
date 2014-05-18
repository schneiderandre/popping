//
//  PasswordStrengthIndicatorView.h
//  Popping
//
//  Created by André Schneider on 18.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PasswordStrengthIndicatorViewStatus) {
    PasswordStrengthIndicatorViewStatusNone,
    PasswordStrengthIndicatorViewStatusWeak,
    PasswordStrengthIndicatorViewStatusFair,
    PasswordStrengthIndicatorViewStatusStrong
};

@interface PasswordStrengthIndicatorView : UIView

@property(nonatomic) PasswordStrengthIndicatorViewStatus status;

@end
