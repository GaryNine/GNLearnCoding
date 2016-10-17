//
//  GNUser.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "GNModel.h"

@class GNImageModel;
@class GNUsers;

@interface GNUser : GNModel <NSCoding>
@property (nonatomic, copy)     NSString    *userID;
@property (nonatomic, copy)     NSString    *firstName;
@property (nonatomic, copy)     NSString    *lastName;
@property (nonatomic, readonly) NSString    *fullName;

@property (nonatomic, copy)     NSURL           *imageURL;
@property (nonatomic, readonly) GNImageModel    *image;

@property (nonatomic, strong)   GNUsers *friends;

@end
