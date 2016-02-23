//
//  GNUserCell.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUserCell.h"

#import "GNUser.h"

@implementation GNUserCell

#pragma mark -
#pragma mark Accessors

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(GNUser *)user {
    self.fullNameLabel.text = user.fullName;
    self.userImageView.image = user.image;
}

@end
