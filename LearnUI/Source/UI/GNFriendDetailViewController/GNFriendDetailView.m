//
//  GNFriendDetailView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendDetailView.h"

#import "GNImageView.h"
#import "GNuser.h"

@interface GNFriendDetailView ()

- (void)fillWithModel:(GNUser *)user;

@end

@implementation GNFriendDetailView

#pragma mark -
#pragma mark Accessors

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    [self fillWithModel:user];
}

#pragma mark - 
#pragma mark Private

- (void)fillWithModel:(GNUser *)user {
    self.imageView.imageModel = user.image;
    self.firstName.text = user.firstName;
    self.lastName.text = user.lastName;
}

@end
