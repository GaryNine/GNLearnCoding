//
//  GNLoginViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNLoginViewController.h"
#import "GNLoginView.h"

#import "GNFacebookLogin.h"

#import "GNModel.h"

#import "GNFriendsViewController.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNLoginViewController, GNLoginView, loginView)

@interface GNLoginViewController ()
@property (nonatomic, strong)   GNFacebookLogin *facebookLogin;

@end

@implementation GNLoginViewController

#pragma mark -
#pragma mark Accessors

- (void)setModel:(GNModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        _model = model;
        [_model addObserver:self];
    }
}

- (void)setFacebookLogin:(GNFacebookLogin *)facebookLogin {
    if (_facebookLogin != facebookLogin) {
        [_facebookLogin cancel];
        _facebookLogin = facebookLogin;
        [_facebookLogin execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Interface Handling 

- (IBAction)onLogin:(id)sender {
    self.facebookLogin = [GNFacebookLogin contextWithModel:self.model];
}

#pragma mark -
#pragma mark GNModelObserverProtocol

- (void)modelDidLoad:(id)model {
    [self.facebookLogin cancel];
    GNFriendsViewController *controller = [GNFriendsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
