//
//  GNFriendsViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendsViewController.h"

#import "GNFriendsView.h"
#import "GNUser.h"
#import "GNUsers.h"
#import "GNUserCell.h"
#import "GNFriendDetailViewController.h"

#import "UITableView+GNExtensions.h"
#import "UITableView+GNCollectionChangeModel.h"

#import "GNViewControllerMacro.h"
#import "GNDispatch.h"

GNViewControllerBaseViewProperty(GNFriendsViewController, GNFriendsView, friendsView)

@interface GNFriendsViewController ()

@end

@implementation GNFriendsViewController

#pragma mark - 
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.user = nil;
    self.friendsContext = nil;
}

#pragma mark -
#pragma mark Accessros

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
    }
}

-(void)setFriendsContext:(GNFacebookFriendsContext *)friendsContext {
    if (_friendsContext != friendsContext) {
        [_friendsContext cancel];
        _friendsContext = friendsContext;
        _friendsContext.controller = self;
        [_friendsContext execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendsContext = [GNFacebookFriendsContext contextWithUser:self.user];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.user.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUserCell *cell = [tableView cellWithClass:[GNUserCell class]];
    cell.user = self.user.users[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GNUser *friend = self.user.users[indexPath.row];
    
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
