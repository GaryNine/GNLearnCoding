//
//  GNUsersView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNView.h"

@class GNUsers;

@interface GNUsersView : GNView
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;
@property (nonatomic, strong)   IBOutlet UIButton       *editButton;
@property (nonatomic, strong)   IBOutlet UIButton       *addUserButton;

@property (nonatomic, assign, getter=isEditing) BOOL    editing;

@property (nonatomic, strong)   GNUsers *users;

@end
