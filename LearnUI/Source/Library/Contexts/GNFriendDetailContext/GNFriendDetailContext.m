//
//  GNFriendDetailContext.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendDetailContext.h"
#import "GNUser.h"
#import "GNConstants.h"

@implementation GNFriendDetailContext

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    GNUser *user = self.model;
    return user.userID;
}

- (NSDictionary *)parameteres {
    NSString *fields = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@{%@}",
                        kGNFirstNameKey,
                        kGNLastNameKey,
                        kGNGenderKey,
                        kGNEmailKey,
                        kGNBirthdayKey,
                        kGNPictureKey,
                        kGNUrlKey];
    
    return @{kGNFieldsKey : fields};
}

- (void)fillModelWithResult:(NSDictionary *)result {
    GNUser *user = self.model;
    
    user.firstName = result[kGNFirstNameKey];
    user.lastName = result[kGNLastNameKey];
    user.gender = result[kGNGenderKey];
    user.email = result[kGNEmailKey];
    user.birthday = result[kGNBirthdayKey];
    
    NSString *urlString = result[kGNPictureKey][kGNDataKey][kGNUrlKey];
    user.imageURL = [NSURL URLWithString:urlString];
}

@end
