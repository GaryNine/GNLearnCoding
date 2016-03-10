//
//  GNCollectionChangeModel+GNArrayModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel+GNArrayModel.h"

#import "GNSingleIndexCollectionChangeModel.h"
#import "GNDoubleIndexCollectionChangeModel.h"

@implementation GNCollectionChangeModel (GNArrayModel)

+ (instancetype)addModelWithChangeIndex:(NSUInteger)index {
    return [GNSingleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectAdded withIndex:index];
}

+ (instancetype)removeModelWithChangeIndex:(NSUInteger)index {
    return [GNSingleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectRemoved withIndex:index];
}

+ (instancetype)insertModelWithChangeIndex:(NSUInteger)index {
    return [GNSingleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectInserted withIndex:index];
}

+ (instancetype)replaceModelWithChangeIndex:(NSUInteger)index {
    return [GNSingleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectReplaced withIndex:index];
}

+ (instancetype)moveModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [GNDoubleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectMoved
                                                         fromIndex:index
                                                           toIndex:toIndex];
}

+ (instancetype)exchangeModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [GNDoubleIndexCollectionChangeModel modelWithChangeType:kGNChangeTypeObjectExchanged
                                                         fromIndex:index
                                                           toIndex:toIndex];
}

@end
