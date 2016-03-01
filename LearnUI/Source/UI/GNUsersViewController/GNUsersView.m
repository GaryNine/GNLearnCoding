//
//  GNUsersView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsersView.h"

@implementation GNUsersView

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing != editing) {
        _editing = editing;
        
        UIButton *editButton = self.editButton;
        UITableView *tableView = self.tableView;
        [editButton setTitle:!editing ? @"Edit" : @"Done" forState:UIControlStateNormal];
        [tableView setEditing:editing animated:YES];
    }
}

@end
