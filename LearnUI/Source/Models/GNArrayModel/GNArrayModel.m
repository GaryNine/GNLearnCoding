//
//  GNArrayModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNArrayModel.h"

#import "GNSingleIndexCollectionChangeModel.h"
#import "GNDoubleIndexCollectionChangeModel.h"
#import "GNCollectionChangeModel+GNArrayModel.h"

#import "GNArrayModelObserver.h"

@interface GNArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

- (void)notifyObserversWithChangeModel:(GNCollectionChangeModel *)model;

@end

@implementation GNArrayModel

@dynamic objects;
@dynamic count;

#pragma mark -
#pragma mark Initializations & Deallocation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objects {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects copy];
    }
}

- (NSUInteger)count {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects count];
    }
}

#pragma mark -
#pragma mark Public

- (id)objectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects objectAtIndex:index];
    }
}

- (NSUInteger)indexOfObject:(id)object {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        return [mutableObjects indexOfObject:object];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self objectAtIndex:idx];
}

- (void)addObject:(id)object {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            NSUInteger changeIndex = mutableObjects.count;
            [mutableObjects addObject:object];
            
            [self notifyObserversWithChangeModel:[GNCollectionChangeModel addModelWithChangeIndex:changeIndex]];
        }
    }
}

- (void)addObjectsFromArray:(NSArray *)objects {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects addObjectsFromArray:objects];
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeLastObject];
        
        [self notifyObserversWithChangeModel:[GNCollectionChangeModel removeModelWithChangeIndex:self.count - 1]];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeObjectAtIndex:index];
        
        [self notifyObserversWithChangeModel:[GNCollectionChangeModel removeModelWithChangeIndex:index]];
    }
}

- (void)removeObjectsFromArray:(NSArray *)objects {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeObjectsInArray:objects];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            [mutableObjects insertObject:object atIndex:index];
            
            [self notifyObserversWithChangeModel:[GNCollectionChangeModel insertModelWithChangeIndex:index]];
        }
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            [mutableObjects replaceObjectAtIndex:index withObject:object];
            
            [self notifyObserversWithChangeModel:[GNCollectionChangeModel replaceModelWithChangeIndex:index]];
        }
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    if (firstIndex == secondIndex) {
        return;
    }
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        id object = [mutableObjects objectAtIndex:firstIndex];
        [mutableObjects removeObjectAtIndex:firstIndex];
        [mutableObjects insertObject:object atIndex:secondIndex];
        
        [self notifyObserversWithChangeModel:[GNCollectionChangeModel moveModelWithChangeIndex:firstIndex
                                                                                       toIndex:secondIndex]];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
        
        [self notifyObserversWithChangeModel:[GNCollectionChangeModel exchangeModelWithChangeIndex:firstIndex
                                                                                           toIndex:secondIndex]];
    }
}

#pragma mark - 
#pragma mark Private

- (void)notifyObserversWithChangeModel:(GNCollectionChangeModel *)model {
    [self notifyWithSelector:@selector(collection:didChangeWithModel:) withObject:model];
}

@end
