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
#import "GNUserFriendsContext.h"
#import "GNUserCell.h"
#import "GNFriendDetailViewController.h"
#import "GNModel.h"

#import "UITableView+GNExtensions.h"
#import "UITableView+GNCollectionChangeModel.h"

#import "GNViewControllerMacro.h"
#import "GNDispatch.h"

GNViewControllerBaseViewProperty(GNFriendsViewController, GNFriendsView, friendsView)

@interface GNFriendsViewController ()
@property (nonatomic, strong)   GNUserFriendsContext    *friendsContext;

@end

@implementation GNFriendsViewController

#pragma mark - 
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.model = nil;
    self.friendsContext = nil;
}

#pragma mark -
#pragma mark Accessros

- (void)setUsers:(GNUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        _users = users;
        [_users addObserver:self];
    }
}

- (void)setModel:(GNModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
        
        self.friendsContext = [GNUserFriendsContext contextWithUser:self.model];
    }
}

-(void)setFriendsContext:(GNUserFriendsContext *)friendsContext {
    if (_friendsContext != friendsContext) {
        [_friendsContext cancel];
        _friendsContext = friendsContext;
        [_friendsContext execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendsContext = [GNUserFriendsContext contextWithUser:self.model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUserCell *cell = [tableView cellWithClass:[GNUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUser *friend = self.users[indexPath.row];
    
    GNFriendDetailViewController *controller = [GNFriendDetailViewController new];
    controller.model = friend;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark GNArrayModelObserver

- (void)collection:(NSArray *)arrayModel didChangeWithModel:(GNCollectionChangeModel *)changeModel {
    UITableView *tableView = self.friendsView.tableView;
    [tableView updateWithCollectionChangeModel:changeModel];
}

#pragma mark -
#pragma mark GNModelObserverProtocol

- (void)modelWillLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.friendsView setLoadingViewVisible:YES animated:YES];
    });
}

- (void)modelDidLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.friendsView setLoadingViewVisible:NO animated:NO];
        self.friendsContext = nil;
        [self.friendsView.tableView reloadData];
    });
}

- (void)modelDidFailWithLoading:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.friendsView setLoadingViewVisible:NO animated:NO];
    });
}

@end
