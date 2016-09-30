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
#import "GNLoadingView.h"

#import "UITableView+GNExtensions.h"
#import "UITableView+GNCollectionChangeModel.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNUsersViewController, GNUsersView, usersView)

@interface GNUsersViewController ()

- (void)updateView;

@end

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
      
        [_users load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.users load];
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
#pragma mark Private

- (void)updateView {
    [self.usersView.tableView reloadData];
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
        
        [self updateView];
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

#pragma mark -
#pragma mark GNModelObserverProtocol

- (void)modelWillLoad:(id)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.usersView.loadingViewVisible = YES;
    });
}

- (void)modelDidLoad:(id)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateView];
        self.usersView.loadingViewVisible = NO;
    });
}

- (void)modelDidFailWithLoading:(id)model {
    self.usersView.loadingViewVisible = NO;
}

@end
