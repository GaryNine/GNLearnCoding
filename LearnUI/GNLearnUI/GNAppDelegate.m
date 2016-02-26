//
//  GNAppDelegate.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNAppDelegate.h"

#import "UIWindow+GNExtensions.h"

#import "GNSquareView.h"
#import "GNSquareViewController.h"

#import "GNUsers.h"
#import "GNUsersViewController.h"

@interface GNAppDelegate ()

@end

@implementation GNAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;
    
//    GNSquareViewController *controller = [GNSquareViewController new];
    GNUsersViewController *controller = [GNUsersViewController new];
    controller.users = [GNUsers new];
    
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
