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

GNViewControllerBaseViewProperty(GNUsersViewController, GNUsersView, usersView)

@implementation GNUsersViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // indent from the status bar
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.usersView.tableView.contentInset = inset;
    self.usersView.tableView.scrollIndicatorInsets = inset;

    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITabelViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([GNUserCell class]);
    
    GNUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = self.user;
    
    return cell;
}

@end
