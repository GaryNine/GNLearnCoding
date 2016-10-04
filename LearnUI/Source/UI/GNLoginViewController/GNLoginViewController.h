//
//  GNLoginViewController.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNModelObserver.h"

@class GNModel;
@class GNFacebookLogin;

@interface GNLoginViewController : UIViewController <GNModelObserver>
@property (nonatomic, strong)   GNModel *model;

- (IBAction)onLogin:(id)sender;

@end
