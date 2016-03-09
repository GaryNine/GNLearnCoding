//
//  GNCollectionChangeModel+GNArrayModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel+GNArrayModel.h"

#import "GNCollectionSingleIndexChangeModel.h"
#import "GNCollectionDoubleIndexChangeModel.h"

@implementation GNCollectionChangeModel (GNArrayModel)

+ (instancetype)addModelWithChangeIndex:(NSUInteger)index {
    return [GNCollectionSingleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectAdded withIndex:index];
}

+ (instancetype)removeModelWithChangeIndex:(NSUInteger)index {
    return [GNCollectionSingleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectRemoved withIndex:index];
}

+ (instancetype)insertModelWithChangeIndex:(NSUInteger)index {
    return [GNCollectionSingleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectInserted withIndex:index];
}

+ (instancetype)replaceModelWithChangeIndex:(NSUInteger)index {
    return [GNCollectionSingleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectReplaced withIndex:index];
}

+ (instancetype)moveModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [GNCollectionDoubleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectMoved
                                                         fromIndex:index
                                                           toIndex:toIndex];
}

+ (instancetype)exchangeModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [GNCollectionDoubleIndexChangeModel modelWithChangeType:kGNChangeTypeObjectExchanged
                                                         fromIndex:index
                                                           toIndex:toIndex];
}

@end
