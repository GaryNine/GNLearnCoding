//
//  GNFacebookFriends.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFacebookFriendsContext.h"

#import "GNUser.h"

@interface GNFacebookFriendsContext ()

@end

@implementation GNFacebookFriendsContext

#pragma mark -
#pragma mark Public

- (void)load {
    GNUser *user = self.model;
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:user.userID
                                                                   parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
    }];
}

@end
