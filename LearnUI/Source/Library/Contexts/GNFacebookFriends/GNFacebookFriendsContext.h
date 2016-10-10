//
//  GNFacebookFriends.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

@class GNFriendsViewController;

@interface GNFacebookFriendsContext : GNContext
@property (nonatomic, weak) GNFriendsViewController *controller;

@end
