//
//  GNImageModelCache.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCacheModel.h"

#import "GNDispatchOnce.h"

@interface GNCacheModel ()
@property (nonatomic, strong)   NSMapTable  *models;

- (NSArray *)allKeys;

@end

@implementation GNCacheModel

#pragma mark -
#pragma mark Class Methods

+ (GNCacheModel *)cache {
    GNDispatchOnce(GNCacheModel, cache, ^{ return [GNCacheModel new]; });
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.models = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.models objectForKey:key];
    }
}

- (void)setObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.models setObject:object forKey:key];
    }
}

- (id)objectForKeydSubscript:(id)key {
    return [self objectForKey:key];
}

- (void)setObject:(id)object forKeydSubscript:(id)key {
    if (object) {
        [self setObject:object forKey:key];
    } else {
        [self removeObjectForKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.models removeObjectForKey:key];
    }
}

#pragma mark -
#pragma mark Private

- (NSArray *)allKeys {
    @synchronized (self) {
        return [[self.models keyEnumerator] allObjects];
    }
}

@end
