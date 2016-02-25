//
//  GNArrayModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNArrayModel.h"

@interface GNArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

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

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self objectAtIndex:idx];
}

- (void)addObject:(id)object {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            [mutableObjects addObject:object];
        }
    }
}

- (void)removeLastObject {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeLastObject];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects removeObjectAtIndex:index];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            [mutableObjects insertObject:object atIndex:index];
        }
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (object) {
        NSMutableArray *mutableObjects = self.mutableObjects;
        @synchronized(mutableObjects) {
            [mutableObjects replaceObjectAtIndex:index withObject:object];
        }
    }
}

- (void)moveObjectAtIndex:(NSUInteger)firstIndex toIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        id object = [mutableObjects objectAtIndex:firstIndex];
        [mutableObjects removeObjectAtIndex:firstIndex];
        [mutableObjects insertObject:object atIndex:secondIndex];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableObjects = self.mutableObjects;
    @synchronized(mutableObjects) {
        [mutableObjects exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
}

@end
