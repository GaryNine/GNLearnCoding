//
//  GNCollectionDoubleIndexChangeModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNSingleIndexCollectionChangeModel.h"

typedef NS_ENUM(NSUInteger, kGNDoubleIndexChangeType) {
    kGNChangeTypeObjectExchanged,
    kGNChangeTypeObjectMoved
};

@interface GNDoubleIndexCollectionChangeModel : GNSingleIndexCollectionChangeModel
@property (nonatomic, readonly)   NSUInteger  toIndex;

+ (instancetype)modelWithChangeType:(NSUInteger)changeType
                          fromIndex:(NSUInteger)index
                            toIndex:(NSUInteger)toIndex;

@end
