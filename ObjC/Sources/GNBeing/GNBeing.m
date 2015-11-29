//
//  GNBeing.m
//  GNLearnObjC
//
//  Created by Igor Devyatko on 11/19/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNBeing.h"

@interface GNBeing()

@property (nonatomic, readwrite, retain)    NSMutableSet    *mutableChildren;
@property (nonatomic, readwrite)            GNGenderType    gender;

@end

@implementation GNBeing

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)beingWithGender:(GNGenderType)gender {
    return [[[self alloc] initWithGender:gender] autorelease];
    
}

#pragma mark - 
#pragma mark Initializations & Deallocation

- (instancetype)initWithGender:(GNGenderType)gender {
    self = [super init];
    
    if (self) {
        self.gender = gender;
    }
    
    return self;
}

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accesors

- (NSSet *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)fight {
    NSLog(@"Went To Fight! %@", self);
}

- (instancetype)reproduce {
    return [[self class]beingWithGender:kGNFemale];
}

- (void)addChild:(GNBeing *)child {
    [self.mutableChildren addObject:child];
}

- (void)removeChild:(GNBeing *)child {
    [self.mutableChildren removeObject:child];
}

- (void)sayHello {
    NSLog(@"Wazz'up? %@", self);
    
    for (GNBeing *child in self.children) {
        [child sayHello];
    }
}

@end
