//
//  GNUsersViewController.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GNUser;

@interface GNUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)   GNUser  *user;

- (IBAction)onEdit:(id)sender;
- (IBAction)onAddUser:(id)sender;

@end
