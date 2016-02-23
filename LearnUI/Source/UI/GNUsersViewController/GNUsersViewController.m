//
//  GNUsersViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNViewControllerMacro.h"

#import "GNUsersViewController.h"

#import "GNUser.h"
#import "GNUsersView.h"
#import "GNUserCell.h"

#import "UITableView+GNExtensions.h"

GNViewControllerBaseViewProperty(GNUsersViewController, GNUsersView, usersView)

@implementation GNUsersViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Public

- (IBAction)onEdit:(id)sender {
    if ([self.usersView.tableView isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.usersView.tableView setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.usersView.tableView setEditing:YES animated:YES];
    }
}

- (IBAction)onAddUser:(id)sender {
    [self.usersView.tableView beginUpdates];
  
}

#pragma mark -
#pragma mark UITabelViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUserCell *cell = [tableView cellWithClass:[GNUserCell class]];
    cell.user = self.user;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
}

@end
