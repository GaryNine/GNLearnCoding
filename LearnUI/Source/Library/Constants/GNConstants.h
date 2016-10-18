//
//  GNConstants.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GNConstant(name, string) static NSString * const name = string;

#pragma mark -
#pragma mark Permissions

GNConstant(kGNEmailPermission, @"email")
GNConstant(kGNUserFriendsPermission, @"user_friends")
GNConstant(kGNPublicProfilePermission, @"public_profile")


#pragma mark -
#pragma mark Keys

GNConstant(kGNUrlKey, @"url")
GNConstant(kGNDataKey, @"data")
GNConstant(kGNPictureKey, @"picture")
GNConstant(kGNFriendsKey, @"friends")
GNConstant(kGNFirstNameKey, @"first_name")
GNConstant(kGNLastNameKey, @"last_name")
GNConstant(kGNFieldsKey, @"fields")
