//
//  GNCollectionChangeModel+GNArrayModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel.h"

@interface GNCollectionChangeModel (GNArrayModel)

+ (instancetype)addedModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)removedModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)insertedModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)replacedModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)movedModelWithChangeIndex:(NSUInteger)index;
+ (instancetype)exchangedModelWithChangeIndex:(NSUInteger)index;

@end
