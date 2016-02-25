//
//  GNArrayModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservableObject.h"

@interface GNArrayModel : GNObservableObject
@property (nonatomic, readonly)   NSArray     *objects;
@property (nonatomic, readonly)   NSUInteger  count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex;
- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex;

@end
