//
//  GNUsersView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsersView.h"

@implementation GNUsersView

- (void)editTableView {
    UIButton *editButton = self.editButton;
    UITableView *tableView = self.tableView;
    BOOL editing = tableView.editing;
    
    [editButton setTitle:editing ? @"Edit" : @"Done" forState:UIControlStateNormal];
    [tableView setEditing:(editing = !editing) animated:YES];
}

@end
