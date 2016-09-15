//
//  GNUsersView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsersView.h"

static NSString * const kGNTitleEdit = @"Edit";
static NSString * const kGNTitleDone = @"Done";

@implementation GNUsersView

@dynamic editing;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tableView.layer.cornerRadius = 10;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isEditing {
    return self.tableView.editing;
}

- (void)setEditing:(BOOL)editing {
    UITableView *tableView = self.tableView;
    if (tableView.editing != editing) {

        [self.editButton setTitle:!editing ? kGNTitleEdit : kGNTitleDone forState:UIControlStateNormal];
        [tableView setEditing:editing animated:YES];
    }
}

@end
