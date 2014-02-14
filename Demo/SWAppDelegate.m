//
//  SWAppDelegate.m
//  ParallaxScrollView
//
//  Created by Sven Weidauer on 14.02.14.
//  Copyright (c) 2014 Sven Weidauer. All rights reserved.
//

#import "SWAppDelegate.h"

#import "SWParallaxDemoViewController.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[SWParallaxDemoViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
