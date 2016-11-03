//
//  GNFriendsViewController.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNArrayModelObserver.h"
#import "GNModelObserver.h"

@interface GNFriendsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,
                                                        GNModelObserver, GNArrayModelObserver>
@property (nonatomic, strong)   id  model; // GNUser

@end
