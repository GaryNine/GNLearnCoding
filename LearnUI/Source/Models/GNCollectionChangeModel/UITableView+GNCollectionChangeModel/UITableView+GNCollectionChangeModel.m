//
//  UITableView+GNCollectionChangeModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UITableView+GNCollectionChangeModel.h"
#import "GNCollectionChangeModel+UITableView.h"

@implementation UITableView (GNCollectionChangeModel)

#pragma mark -
#pragma mark Public

- (void)updateWithCollectionChangeModel:(GNCollectionChangeModel *)model {
    [model updateTableView:self];
}

@end
