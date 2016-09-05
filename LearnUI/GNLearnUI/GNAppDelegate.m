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
@property (nonatomic, strong)   GNUsers *users;

@end

@implementation GNAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;
//    GNSquareViewController *controller = [GNSquareViewController new];
    GNUsersViewController *controller = [GNUsersViewController new];
    window.rootViewController = controller;
    
    GNUsers *users = [GNUsers new];
    controller.users = users;
    self.users = users;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.users save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.users save];
}

@end
