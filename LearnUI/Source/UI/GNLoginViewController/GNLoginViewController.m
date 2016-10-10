//
//  GNLoginViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNLoginViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "GNLoginView.h"
#import "GNFacebookLoginContext.h"
#import "GNFriendsViewController.h"
#import "GNModel.h"
#import "GNView.h"
#import "GNDispatch.h"
#import "GNUser.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNLoginViewController, GNLoginView, loginView)

@interface GNLoginViewController ()
@property (nonatomic, strong)   GNFacebookLoginContext  *facebookLoginContext;

- (void)finishLogin;

@end

@implementation GNLoginViewController

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.model = nil;
    self.facebookLoginContext = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(GNModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
    }
}

- (void)setFacebookLoginContext:(GNFacebookLoginContext *)facebookLoginContext {
    if (_facebookLoginContext != facebookLoginContext) {
        [_facebookLoginContext cancel];
        _facebookLoginContext = facebookLoginContext;
        _facebookLoginContext.controller = self;
        [_facebookLoginContext execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self finishLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Interface Handling 

- (IBAction)onLogin:(id)sender {
    self.model = [GNModel new];
    self.facebookLoginContext = [GNFacebookLoginContext contextWithModel:self.model];
}

#pragma mark -
#pragma mark Private

- (void)finishLogin {
    FBSDKAccessToken *accessToken = [FBSDKAccessToken currentAccessToken];
    if (accessToken) {
        GNUser *user = [GNUser new];
        user.userID = accessToken.userID;
        GNFriendsViewController *controller = [GNFriendsViewController new];
        controller.user = user;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark -
#pragma mark GNModelObserverProtocol

- (void)modelWillLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.loginView setLoadingViewVisible:YES animated:YES];
    });
}

- (void)modelDidLoad:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.loginView setLoadingViewVisible:NO animated:NO];
        self.facebookLoginContext = nil;
        [self finishLogin];
    });
}

- (void)modelDidFailWithLoading:(id)model {
    GNDispatchAsyncOnMainQueue(^ {
        [self.loginView setLoadingViewVisible:NO animated:NO];
    });
}

@end
