//
//  HelloPollyAppDelegate.m
//  HelloPolly
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright Cosmin Stejerean 2010. All rights reserved.
//

#import "HelloPollyAppDelegate.h"

@implementation HelloPollyAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
