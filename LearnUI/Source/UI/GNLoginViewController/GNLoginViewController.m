//
//  GNLoginViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNLoginViewController.h"
#import "GNLoginView.h"

#import "GNFriendsViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNLoginViewController, GNLoginView, loginView)

@interface GNLoginViewController ()

@end

@implementation GNLoginViewController

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
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc ] init];
    [login logInWithReadPermissions:<#(NSArray *)#>
                 fromViewController:self
                            handler:nil];
    
    GNFriendsViewController *controller = [GNFriendsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
