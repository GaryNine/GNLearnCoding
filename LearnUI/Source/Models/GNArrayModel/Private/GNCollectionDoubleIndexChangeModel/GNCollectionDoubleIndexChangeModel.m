//
//  GNCollectionDoubleIndexChangeModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionDoubleIndexChangeModel.h"

@interface GNCollectionDoubleIndexChangeModel ()
@property (nonatomic, assign)   NSUInteger  toIndex;

@end

@implementation GNCollectionDoubleIndexChangeModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          fromIndex:(NSUInteger)index
                            toIndex:(NSUInteger)toIndex
{
    GNCollectionDoubleIndexChangeModel * model = [super modelWithChangeType:changeType
                                                                  withIndex:index];
    model.toIndex = toIndex;
    
    return model;
}

@end
