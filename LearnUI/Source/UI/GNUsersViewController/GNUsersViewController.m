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
    users.state = kGNObjectAdded;
}

#pragma mark -
#pragma mark UITabelViewDataSource

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

- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.users removeObjectAtIndex:indexPath.row];
    }
    // перенести логику
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
}

- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark GNCollectionObserver

- (void)collectionDidObjectAdd {
    NSArray *objects = self.users.objects;
    NSUInteger lastRow = [objects indexOfObject:[objects lastObject]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.usersView.tableView insertRowsAtIndexPaths:@[indexPath]
                                    withRowAnimation:UITableViewRowAnimationTop];
    self.users.state = kGNObjectInitialChangeType;
}

- (void)collectionDidObjectRemove {
    
}

@end
