//
//  GNCollectionSingleIndexChangeModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionSingleIndexChangeModel.h"

@implementation GNCollectionSingleIndexChangeModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          withIndex:(NSUInteger)index
{
    GNCollectionSingleIndexChangeModel *model = [super changeModelWithChangeType:changeType];
    model.index = index;
    
    return model;
}

@end
