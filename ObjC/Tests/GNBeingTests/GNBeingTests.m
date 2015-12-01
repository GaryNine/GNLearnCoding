//
//  GNBeingTests.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/30/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNBeingTests.h"

@interface GNBeingTests()

+ (void)beingTest;
+ (void)childrenArrayTest;
+ (void)genderSpecificOperationTest;
+ (void)sayHelloTest;

@end

@implementation GNBeingTests

#pragma mark -
#pragma mark Public Implementations

+ (void)performBeingTests {
    [self beingTest];
    [self childrenArrayTest];
    [self genderSpecificOperationTest];
    [self sayHelloTest];
}

#pragma mark -
#pragma mark Private Implementations

+ (void)beingTest {
    
    // after being instance created with gender male:
    GNMale *male = [GNMale beingWithGender:kGNMale];
    
        // instance must not be nil
    NSAssert(male != nil, @"Object not created");
    
        // instance gender must be male
    NSAssert([male gender] == kGNMale, @"Gender init is incorrect");
    
        // instance name must be nil
    NSAssert([male name] == nil, @"Name init is incorrect");
    
        // instance children must be nil
    NSAssert([male children] == nil, @"Children init is incorrect");
    
        // instance weight must be null
    NSAssert([male weight] == 0, @"Weight init is incorrect");
    
        // instance age must be null
    NSAssert([male age] == 0, @"Age init is incorrect");
    
    // after being instance created with gender female:
    GNFemale *female = [GNFemale beingWithGender:kGNFemale];
    
        // instance must not be nil
    NSAssert(female != nil, @"Object not created");
    
        // instance gender must be male
    NSAssert([female gender] == kGNFemale, @"Gender init is incorrect");
    
        // instance name must be nil
    NSAssert([female name] == nil, @"Name init is incorrect");
    
        // instance children must be nil
    NSAssert([female children] == nil, @"Children init is incorrect");
    
    
        // instance weight must be null
    NSAssert([female weight] == 0, @"Weight init is incorrect");
    
        // instance age must be null
    NSAssert([male age] == 0, @"Age init is incorrect");
}

+ (void)childrenArrayTest {
    
    // after instances created:
    GNMale *man = [GNMale beingWithGender:kGNMale];
    GNFemale *woman = [GNFemale beingWithGender:kGNFemale];
    
    GNMale *someChild = [GNMale beingWithGender:kGNMale];
    GNMale *anotherChild = [GNMale beingWithGender:kGNFemale];
    
        // after man puted someChild into the array
    [man addChild:(id<GNBeingProtocol>)someChild];
    
            // children count must be 1
    NSAssert([[man children] count] == 1, @"Man doesn't have children");
    
            // array must contains someChild
    NSAssert([[man children] containsObject:someChild], @"Array doesn't contains someChild");
    
        // after man puted anotherChild into the array
    [man addChild:(id<GNBeingProtocol>)anotherChild];
    
            // children count must be 2
    NSAssert([[man children] count] == 2, @"Man doesn't have children");
    
            // array must contains anotherChild
    NSAssert([[man children] containsObject:anotherChild], @"Array doesn't contains anotherChild");
    
        // after man removed someChild from the array
    [man removeChild:someChild];
    
            // children count must be 1
    NSAssert([[man children] count] == 1, @"Array didn't remove someChild");
    
            // array must not contains someChild
    NSAssert(false == [[man children] containsObject:someChild], @"Array still contains someChild");
    
        // after man removed anotherChild from the array
    [man removeChild:anotherChild];
    
            // children count must be 0
    NSAssert([[man children] count] == 0, @"Array didn't remove anotherChild");
    
            // array must not contains anotherChild
    NSAssert(false == [[man children] containsObject:anotherChild], @"Array still contains anotherChild");
    
        // after woman puted someChild into the array
    [woman addChild:(id<GNBeingProtocol>)someChild];
    
            // children count must be 1
    NSAssert([[woman children] count] == 1, @"Woman doesn't have children");
    
            // array must contains someChild
    NSAssert([[woman children] containsObject:someChild], @"Array doesn't contains someChild");
    
        // after woman puted anotherChild into the array
    [woman addChild:(id<GNBeingProtocol>)anotherChild];
    
            // children count must be 2
    NSAssert([[woman children] count] == 2, @"Woman doesn't have children");
    
            // array must contains anotherChild
    NSAssert([[woman children] containsObject:anotherChild], @"Array doesn't contains anotherChild");
}

+ (void)genderSpecificOperationTest {
    NSMutableArray *array = [[NSMutableArray new] autorelease];
    
    for (NSUInteger count = 0; count < 25; count++) {
        GNMale *male  = [GNMale beingWithGender:kGNMale];
        GNFemale *female = [GNFemale beingWithGender:kGNFemale];
        
        [array addObject:male];
        [array addObject:female];
    }
    
    for (GNBeing *being in array) {
        id result = [being performGenderSpecificOperation];
        
        if (!result) {
            [being addChild:result];
        }
    }
}

+ (void)sayHelloTest {
    GNFemale *female = [GNFemale beingWithGender:kGNFemale];
    
    for (NSUInteger count = 0; count < 10; count++) {
        GNMale *child = [GNMale beingWithGender:kGNMale];
        [female addChild:child];
    }
    
    [female sayHello];
}

@end
