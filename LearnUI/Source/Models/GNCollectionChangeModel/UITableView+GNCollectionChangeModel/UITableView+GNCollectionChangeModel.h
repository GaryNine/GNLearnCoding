//
//  UITableView+GNCollectionChangeModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GNCollectionChangeModel;

@interface UITableView (GNCollectionChangeModel)

- (void)updateWithCollectionChangeModel:(GNCollectionChangeModel *)model;

@end
