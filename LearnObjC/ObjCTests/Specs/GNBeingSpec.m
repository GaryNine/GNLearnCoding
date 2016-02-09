//
//  GNBeingTests.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/6/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "Kiwi.h"

#import "GNBeing.h"
#import "GNMale.h"
#import "GNFemale.h"
#import "GNTypeDefs.h"

SPEC_BEGIN(GNBeingSpec)

describe(@"GNBeing", ^{
    
    context(@"when being instance created with gender male", ^{
        __block GNMale *male = nil;
        
        beforeAll(^{
            male = [GNMale beingWithGender:kGNMale];
        });
        
        afterAll(^{
            male = nil;
        });
        
        it(@"instance must not be nil", ^{
            [[male shouldNot] beNil];
        });
        
        it(@"instance gender must be male", ^{
            [[male should] beKindOfClass:[GNMale class]];
        });
        
        it(@"instance name must be nil", ^{
            [[[male name] should] beNil];
        });
        
        it(@"instance children must not be nil", ^{
            [[[male children] shouldNot] beNil];
        });
        
        it(@"instance children count must be null", ^{
            [[[male children] should] haveCountOf:2];
        });
        
        it(@"instance weight must be null", ^{
            [[[male should] have:0] weight];
        });
        
        it(@"instance age must be null", ^{
            [[[male should] have:0] age];
        });
        
    });
    
    context(@"when being instance created with gender female", ^{
        __block GNFemale *female = nil;
        
        beforeAll(^{
            female = [GNFemale beingWithGender:kGNFemale];
        });
        
        afterAll(^{
            female = nil;
        });
        
        it(@"instance must not be nil", ^{
            [[female shouldNot] beNil];
        });
        
        it(@"instance gender must be male", ^{
            [[female should] beKindOfClass:[GNFemale class]];
        });
        
        it(@"instance name must be nil", ^{
            [[[female name] should] beNil];
        });
        
        it(@"instance children must not be nil", ^{
            [[[female children] shouldNot] beNil];
        });
        
        it(@"instance children count must be null", ^{
            [[[female children] should] haveCountOf:0];
        });
        
        it(@"instance weight must be null", ^{
            [[[female should] have:0] weight];
        });
        
        it(@"instance age must be null", ^{
            [[[female should] have:0] age];
        });
        
    });
    
    context(@"after test instances for children array was created", ^{
        __block GNFemale *female = nil;
        
        __block GNFemale *firstChild = nil;
        __block GNMale *secondChild = nil;
        
        beforeAll(^{
            female = [GNFemale beingWithGender:kGNFemale];
            
            firstChild = [GNFemale beingWithGender:kGNFemale];
            secondChild = [GNMale beingWithGender:kGNMale];
        });
        
        afterAll(^{
            female = nil;
            
            firstChild = nil;
            secondChild = nil;
        });
        
        context(@"after female puted firstChild into the array", ^{
            [female addChild:firstChild];
            
            it(@"children count must be 1", ^{
                [[[female children] should] haveCountOf:1];
            });
            
            it(@"array must contains firstChild", ^{
                [[[female children] should] containsObject:firstChild];
            });
            
        });
        
        context(@"after female putes secondChild into the array", ^{
            [female addChild:secondChild];
        
            it(@"children count must be 2", ^{
                [[[female children] should] haveCountOf:2];
            });
        
            it(@"array must contains secondChild", ^{
                [[[female children] should] containsObject:secondChild];
            });
        });
        
        context(@"after female removed firstChild", ^{
            [female removeChild:firstChild];
            
            it(@"children count must be 1", ^{
                [[[female children] should] haveCountOf:1];
            });
            
            it(@"array must not contains firstChild", ^{
                [[[female children] shouldNot] containsObject:firstChild];
            });
        });
        
        context(@"after female removed secondChild", ^{
            [female removeChild:secondChild];
            
            it(@"children count must be 0", ^{
                [[[female children] should] haveCountOf:0];
            });
            
            it(@"array must not contains secondChild", ^{
                [[[female children] shouldNot] containsObject:secondChild];
            });
        });
    });
});

SPEC_END