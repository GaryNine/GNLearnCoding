//
//  GNFacebookFriends.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUserFriendsContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "GNUser.h"
#import "GNUsers.h"
#import "GNFriendsViewController.h"

#import "GNConstants.h"

@interface GNUserFriendsContext ()
@property (nonatomic, weak) GNFriendsViewController *controller;

- (instancetype)initWithUser:(GNUser *)user;

- (NSDictionary *)parameters;

@end

@implementation GNUserFriendsContext

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)contextWithUser:(GNUser *)user {
    return [[self alloc] initWithUser:(GNUser *)user];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithUser:(GNUser *)user {
    self = [super init];
    
    self.user = user;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        _user = user;
        
        self.model = user.friends;
    }
}

#pragma mark -
#pragma mark Public

- (NSString *)graphPath {
    return self.user.userID;
}

- (NSDictionary *)parameters {
    NSString *fields = [NSString stringWithFormat:@"%@{%@,%@,%@{%@}}",
                        kGNFriendsKey, kGNFirstNameKey, kGNLastNameKey, kGNPictureKey, kGNUrlKey];
    
    return @{kGNFieldsKey : fields};
}

- (void)fillModelWithResult:(NSDictionary *)result {
    GNUser *user = self.user;

    NSArray *friends = result[kGNFriendsKey][kGNDataKey];
    GNUsers *userFriends = self.model;
    [userFriends performBlockWithoutNotifications:^ {
        for (NSDictionary *friend in friends) {
            user.userID = friend[kGNIDKey];
            user.firstName = friend[kGNFirstNameKey];
            user.lastName = friend[kGNLastNameKey];
            
            NSString *urlString = friend[kGNPictureKey][kGNDataKey][kGNUrlKey];
            user.imageURL = [NSURL URLWithString:urlString];
            
            [userFriends addObject:user];
        }
    }];
}

// need realize
- (BOOL)shouldLoadState:(NSUInteger)state {
    return state;
}

@end
