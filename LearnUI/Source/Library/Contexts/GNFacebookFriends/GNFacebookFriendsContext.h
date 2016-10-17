//
//  GNFacebookFriends.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContext.h"

@class GNUser;

@interface GNFacebookFriendsContext : GNContext
@property (nonatomic, strong)   GNUser *user;

+ (instancetype)contextWithUser:(GNUser *)user;

@end
