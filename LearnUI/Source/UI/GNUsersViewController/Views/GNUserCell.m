//
//  GNUserCell.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUserCell.h"

#import "GNUser.h"

#import "GNLoadingView.h"

@implementation GNUserCell

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.loadingView = [GNLoadingView loadingViewInSuperview:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(GNUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        _user = user;
        [_user addObserver:self];
        
        [_user load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(GNUser *)user {
    self.label.text = user.fullName;
    self.contentImageView.image = user.image;
}

#pragma mark -
#pragma mark GNModelObserver

- (void)modelWillLoad:(id)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loadingView setVisible:YES animated:YES];
    });
}

- (void)modelDidLoad:(id)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self fillWithModel:model];
        [self.loadingView setVisible:NO animated:NO];
    });

}

- (void)modelDidFailWithLoading:(id)model {
    [self.loadingView setVisible:NO animated:NO];
}

@end
