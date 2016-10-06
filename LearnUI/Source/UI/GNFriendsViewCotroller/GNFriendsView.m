//
//  GNFriendsView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFriendsView.h"

@implementation GNFriendsView

#pragma mark -
#pragma mark Initializations & Deallocations 

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        _user = user;
    }
}


@end
