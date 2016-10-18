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

static NSString * const kGNFriendsKey = @"friends";
static NSString * const kGNDataKey = @"data";
static NSString * const kGNFirstNameKey = @"first_name";
static NSString * const kGNLastNameKey = @"last_name";
static NSString * const kGNPictureKey = @"picture";
static NSString * const kGNUrlKey = @"url";
static NSString * const kGNFieldsKey = @"fields";

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
#pragma mark Public

- (void)load {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.user.userID
                                                                   parameters:self.parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result,
                                          NSError *error) {
        GNUsers *userFriends = self.model;
        NSArray *friends = result[kGNFriendsKey][kGNDataKey];
        
        [userFriends performBlockWithoutNotifications:^ {
            for (id friend in friends) {
                GNUser *user = [GNUser new];
                user.firstName = friend[kGNFirstNameKey];
                user.lastName = friend[kGNLastNameKey];
                
                NSString *urlString = friend[kGNPictureKey][kGNDataKey][kGNUrlKey];
                user.imageURL = [NSURL URLWithString:urlString];
                [userFriends addObject:user];
            }
        }];
        
        self.controller.users = userFriends;
        userFriends.state = kGNModelStateDidLoad;
    }];
}

#pragma mark -
#pragma mark Private

- (NSDictionary *)parameters {
    NSString *fields = [NSString stringWithFormat:@"%@{%@,%@,%@{%@}}",
                        kGNFriendsKey, kGNFirstNameKey, kGNLastNameKey, kGNPictureKey, kGNUrlKey];
    
    return @{kGNFieldsKey : fields};
}

@end
