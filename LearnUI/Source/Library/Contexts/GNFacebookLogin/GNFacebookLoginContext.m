//
//  GNFacebookLogin.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "GNFacebookLoginContext.h"
#import "GNLoginViewController.h"

#import "GNModel.h"

@implementation GNFacebookLoginContext

#pragma mark -
#pragma mark Public

- (void)load {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc ] init];
    GNModel *model = self.model;
    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                 fromViewController:self.controller
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error || result.isCancelled) {
                                    NSLog(@"Process error");
                                    [model setState:kGNModelStateDidFailWithLoading withObject:error];
                                } else {
                                    NSLog(@"Logged in");
                                    model.state = kGNModelStateDidLoad;
                                }
                            }];
}

@end
