//
//  GNFriendsViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendsViewController.h"

#import "GNFriendsView.h"
#import "GNUsers.h"
#import "GNUserCell.h"

#import "UITableView+GNExtensions.h"
#import "UITableView+GNCollectionChangeModel.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNFriendsViewController, GNFriendsView, friendsView)

@interface GNFriendsViewController ()

@end

@implementation GNFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSUInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUserCell *cell = [tableView cellWithClass:[GNUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark GNArrayModelObserver

- (void)collection:(NSArray *)arrayModel didChangeWithModel:(GNCollectionChangeModel *)changeModel {
    UITableView *tableView = self.friendsView.tableView;
    [tableView updateWithCollectionChangeModel:changeModel];
}
@end
