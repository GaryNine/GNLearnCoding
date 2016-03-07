//
//  GNCollectionDoubleIndexChangeModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionSingleIndexChangeModel.h"

typedef NS_ENUM(NSUInteger, kGNDoubleIndexChangeType) {
    kGNChangeTypeObjectExchanged,
    kGNChangeTypeObjectMoved
};

@interface GNCollectionDoubleIndexChangeModel : GNCollectionSingleIndexChangeModel
@property (nonatomic, assign)   NSUInteger  secondIndex;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          fromIndex:(NSUInteger)index
                            toIndex:(NSUInteger)secondIndex;

@end
