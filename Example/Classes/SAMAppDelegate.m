//
//  SAMAppDelegate.m
//  SAMCircleProgressView
//
//  Created by Sam Soffes on 3/13/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "SAMAppDelegate.h"
#import "SAMDemoViewController.h"

@implementation SAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[SAMDemoViewController alloc] init];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
