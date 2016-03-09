//
//  GNCollectionChangeModel+GNArrayModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel.h"

@interface GNCollectionChangeModel (GNArrayModel)

+ (instancetype)addModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)removeModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)insertModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)replaceModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)moveModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;
+ (instancetype)exchangeModelWithChangeIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;

@end
