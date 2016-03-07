//
//  GNCollectionSingleIndexChangeModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel.h"

typedef NS_ENUM(NSUInteger, GNCollectionChangeType) {
    kGNChangeTypeObjectAdded,
    kGNChangeTypeObjectRemoved,
    kGNChangeTypeObjectInserted,
    kGNChangeTypeObjectReplaced
};

@interface GNCollectionSingleIndexChangeModel : GNCollectionChangeModel
@property (nonatomic, assign)   NSUInteger  index;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          withIndex:(NSUInteger)index;

@end
