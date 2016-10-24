//
//  GNFacebookContext.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface GNFacebookContext : GNContext
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;

- (NSString *)graphPath;
- (NSDictionary *)parameteres;

- (void)fillModelWithResult:(NSDictionary *)result;

@end
