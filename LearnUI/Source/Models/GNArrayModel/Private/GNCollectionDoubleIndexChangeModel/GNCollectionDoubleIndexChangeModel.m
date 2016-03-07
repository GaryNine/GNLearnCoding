//
//  GNCollectionDoubleIndexChangeModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionDoubleIndexChangeModel.h"

@implementation GNCollectionDoubleIndexChangeModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          fromIndex:(NSUInteger)index
                            toIndex:(NSUInteger)secondIndex
{
    GNCollectionDoubleIndexChangeModel * model = [super modelWithChangeType:changeType
                                                                  withIndex:index];
    model.secondIndex = secondIndex;
    
    return model;
}

@end
