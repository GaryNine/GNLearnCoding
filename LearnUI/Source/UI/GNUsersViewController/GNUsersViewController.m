//
//  GNUsersViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsersViewController.h"

#import "GNUser.h"
#import "GNUsers.h"
#import "GNUsersView.h"
#import "GNUserCell.h"

#import "UITableView+GNExtensions.h"
#import "UITableView+GNCollectionChangeModel.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNUsersViewController, GNUsersView, usersView)

@implementation GNUsersViewController

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {    
    self.users = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(GNUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        _users = users;
        [_users addObserver:self];
        
        [self.usersView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // перенести в tableView:commitEditingStyle:
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onEdit:(id)sender {
    GNUsersView *view = self.usersView;
    view.editing = !view.editing;
}

- (IBAction)onAddUser:(id)sender {
    GNUsers *users = self.users;
    [users addObject:[GNUser new]];
}

#pragma mark -
#pragma mark UITabelViewDataSource

// @required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GNUserCell *cell = [tableView cellWithClass:[GNUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

// @optional
- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.users removeObjectAtIndex:indexPath.row];
    }
}

- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark GNCollectionObserver

- (void)collection:(NSArray *)arrayModel didChangeWithModel:(GNCollectionChangeModel *)changeModel {
    UITableView *tableView = self.usersView.tableView;
    [tableView updateWithCollectionChangeModel:changeModel];
}

@end
