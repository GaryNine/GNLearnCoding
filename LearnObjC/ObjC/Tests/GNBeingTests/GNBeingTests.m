//
//  GNBeingTests.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/30/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNBeingTests.h"

@interface GNBeingTests()

- (void)beingTest;
- (void)childrenArrayTest;
- (void)genderSpecificOperationTest;

@end

@implementation GNBeingTests

#pragma mark -
#pragma mark Public Implementations

- (void)performTests {
    [self beingTest];
    [self childrenArrayTest];
    [self genderSpecificOperationTest];
}

#pragma mark -
#pragma mark Private Implementations

- (void)beingTest {
    
    // after being instance created with gender male:
    GNMale *male = [GNMale beingWithGender:kGNMale];
    
        // instance must not be nil
    NSAssert(nil != male, @"Object not created");
    
        // instance gender must be male
    NSAssert(kGNMale == [male gender], @"Gender init is incorrect");
    
        // instance name must be nil
    NSAssert(nil == [male name], @"Name init is incorrect");
    
        // instance children must not be nil
    NSAssert(nil != [male children], @"Children init is incorrect");
    
        // instance children count must be null
    NSAssert(0 == [[male children]count], @"Children count is not equal to 0");
    
        // instance weight must be null
    NSAssert(0 == [male weight], @"Weight init is incorrect");
    
        // instance age must be null
    NSAssert(0 == [male age], @"Age init is incorrect");
    
    // after being instance created with gender female:
    GNFemale *female = [GNFemale beingWithGender:kGNFemale];
    
        // instance must not be nil
    NSAssert(nil != female, @"Object not created");
    
        // instance gender must be male
    NSAssert(kGNFemale == [female gender], @"Gender init is incorrect");
    
        // instance name must be nil
    NSAssert(nil == [female name], @"Name init is incorrect");
    
        // instance children must not be nil
    NSAssert(nil != [female children], @"Children init is incorrect");
    
        // instance children count must be null
    NSAssert(0 == [[male children]count], @"Children count is not equal to 0");
    
        // instance weight must be null
    NSAssert(0 == [female weight], @"Weight init is incorrect");
    
        // instance age must be null
    NSAssert(0 == [male age], @"Age init is incorrect");
}

- (void)childrenArrayTest {
    
    // after instances created:
    GNMale *man = [GNMale beingWithGender:kGNMale];
    GNFemale *woman = [GNFemale beingWithGender:kGNFemale];
    
    GNMale *someChild = [GNMale beingWithGender:kGNMale];
    GNMale *anotherChild = [GNMale beingWithGender:kGNFemale];
    
        // after man puted someChild into the array
    [man addChild:someChild];
    
            // children count must be 1
    NSAssert(1 == [[man children] count], @"Man doesn't have children");
    
            // array must contains someChild
    NSAssert([[man children] containsObject:someChild], @"Array doesn't contains someChild");
    
        // after man puted anotherChild into the array
    [man addChild:anotherChild];
    
            // children count must be 2
    NSAssert(2 == [[man children] count], @"Man doesn't have children");
    
            // array must contains anotherChild
    NSAssert([[man children] containsObject:anotherChild], @"Array doesn't contains anotherChild");
    
        // after man removed someChild from the array
    [man removeChild:someChild];
    
            // children count must be 1
    NSAssert(1 == [[man children] count], @"Array didn't remove someChild");
    
            // array must not contains someChild
    NSAssert(NO == [[man children] containsObject:someChild], @"Array still contains someChild");
    
        // after man removed anotherChild from the array
    [man removeChild:anotherChild];
    
            // children count must be 0
    NSAssert(0 == [[man children] count], @"Array didn't remove anotherChild");
    
            // array must not contains anotherChild
    NSAssert(NO == [[man children] containsObject:anotherChild], @"Array still contains anotherChild");
    
        // after woman puted someChild into the array
    [woman addChild:someChild];
    
            // children count must be 1
    NSAssert(1 == [[woman children] count], @"Woman doesn't have children");
    
            // array must contains someChild
    NSAssert([[woman children] containsObject:someChild], @"Array doesn't contains someChild");
    
        // after woman puted anotherChild into the array
    [woman addChild:anotherChild];
    
            // children count must be 2
    NSAssert(2 == [[woman children] count], @"Woman doesn't have children");
    
            // array must contains anotherChild
    NSAssert([[woman children] containsObject:anotherChild], @"Array doesn't contains anotherChild");
}

- (void)genderSpecificOperationTest {
    
    // after test array created:
    NSMutableArray *array = [[NSMutableArray new] autorelease];
    
        // after test instances created:
    for (NSUInteger count = 0; count < 25; count++) {
        GNMale *male  = [GNMale beingWithGender:kGNMale];
        GNFemale *female = [GNFemale beingWithGender:kGNFemale];
       
            // add test instances into the array
        [array addObject:male];
        [array addObject:female];
    }
    
            // send message performGenderSpecificOperation to all instances into the array
    for (GNBeing *being in array) {
        id result = [being performGenderSpecificOperation];
        
        if (!result) {
            [being addChild:result];
        }
    }
    
            // send message sayHello to everyone into the array
    [array makeObjectsPerformSelector:@selector(sayHello)];
}

@end
