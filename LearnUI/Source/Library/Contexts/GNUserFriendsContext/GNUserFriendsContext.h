//
//  GNFacebookFriends.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContext.h"
#import "GNFacebookContext.h"

@class GNUser;

@interface GNUserFriendsContext : GNFacebookContext
@property (nonatomic, strong)   GNUser *user;

+ (instancetype)contextWithUser:(GNUser *)user;

@end
