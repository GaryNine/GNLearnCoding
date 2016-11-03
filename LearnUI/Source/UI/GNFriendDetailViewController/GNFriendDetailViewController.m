//
//  GNFriendDetailViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendDetailViewController.h"

#import "GNFriendDetailView.h"
#import "GNFriendDetailContext.h"
#import "GNModel.h"
#import "GNDispatch.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNFriendDetailViewController, GNFriendDetailView, friendDetailView)

@interface GNFriendDetailViewController ()
@property (nonatomic, strong)   GNFriendDetailContext   *context;

@end

@implementation GNFriendDetailViewController

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(GNModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
        
        self.context = [GNFriendDetailContext contextWithModel:self.model];
    }
}

- (void)setContext:(GNFriendDetailContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.context = [GNFriendDetailContext contextWithModel:self.model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark GNModelObserver

- (void)modelWillLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.friendDetailView setLoadingViewVisible:YES animated:YES];
    });
}

- (void)modelDidLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^{
        [self.friendDetailView setLoadingViewVisible:NO animated:NO];
         self.friendDetailView.user = model;
    });
}

- (void)modelDidFailWithLoading:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.friendDetailView setLoadingViewVisible:NO animated:NO];
    });
}

@end
