//
//  GNFriendsViewController.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNFacebookFriendsContext.h"
#import "GNArrayModelObserver.h"

@class GNUser;

@interface GNFriendsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,
                                                        GNArrayModelObserver>
@property (nonatomic, strong)   GNUser                      *user;
@property (nonatomic, strong)   GNFacebookFriendsContext    *friendsContext;

@end
