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
     NSString * reuseIdentifier = NSStringFromClass([GNUserCell class]);
    
    GNUserCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
    }
    cell.textLabel.text = self.user.fullName;
    
    return cell;
}

@end
