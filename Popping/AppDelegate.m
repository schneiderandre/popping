//
//  AppDelegate.m
//  Popping
//
//  Created by André Schneider on 06.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "AppDelegate.h"
#import "AnimationsListViewController.h"
#import "UIColor+CustomColors.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    AnimationsListViewController *animationsListViewController = [AnimationsListViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:animationsListViewController];

    [self.window setRootViewController:navigationController];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.tintColor = [UIColor customBlueColor];
    [self.window makeKeyAndVisible];

    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir" size:20],
                                                           NSForegroundColorAttributeName: [UIColor customGrayColor]}];

    return YES;
}

@end
