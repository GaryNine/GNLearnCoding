//
//  GNAppDelegate.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNAppDelegate.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "UIWindow+GNExtensions.h"

#import "GNLoginViewController.h"

#import "GNSquareView.h"
#import "GNSquareViewController.h"

#import "GNUsers.h"
#import "GNUsersViewController.h"

#import "GNPrintMethodMacro.h"

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
//    GNUsersViewController *controller = [GNUsersViewController new];
    GNLoginViewController *controller = [GNLoginViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc ] initWithRootViewController:controller];
    window.rootViewController = navigationController;
    
//    GNUsers *users = [GNUsers new];
//    controller.users = users;
//    self.users = users;
    
    [window makeKeyAndVisible];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    GNPrintMethod;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    GNPrintMethod;
    [self.users save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    GNPrintMethod;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    GNPrintMethod;
    
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    GNPrintMethod;
    [self.users save];
}

@end
