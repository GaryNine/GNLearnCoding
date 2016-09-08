//
//  GNUsersViewController.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNCollectionObserver.h"
#import "GNModelObserverProtocol.h"

@class GNUsers;

@interface GNUsersViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,
                                                    GNCollectionObserver, GNModelObserverProtocol>
@property (nonatomic, strong)   GNUsers  *users;

- (IBAction)onEdit:(id)sender;
- (IBAction)onAddUser:(id)sender;

@end
