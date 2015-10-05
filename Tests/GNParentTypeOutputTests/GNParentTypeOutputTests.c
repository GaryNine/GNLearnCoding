//
//  OutputParentTypeTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#include <stdio.h>
#include <assert.h>

#include "GNParentTypeOutputTests.h"
#include "GNParentTypeOutput.h"

#pragma mark -
#pragma mark Private Declarations

// The Group of test methods
void GNCheckParentTypeMother(void);
void GNCheckParentTypeFather(void);
void GNCheckParentTypeMotherFather(void);
void GNCheckParentTypeUndefined(void);
void GNParentTypeOutputLoopTest(void);

#pragma mark -
#pragma mark Public Implementations

void GNParentTypeOutputTests() {
    GNCheckParentTypeMother();
    GNCheckParentTypeFather();
    GNCheckParentTypeMotherFather();
    GNCheckParentTypeUndefined();
    GNParentTypeOutputLoopTest();
}

#pragma mark - 
#pragma mark Private Implementations

// Cheking of Parent Type Mother
 void GNCheckParentTypeMother(void) {
     assert(GNParentTypeOutput(3) == kGNParentTypeMother);
     assert(GNParentTypeOutput(9) == kGNParentTypeMother);
}

// Cheking of Parent Type Father
void GNCheckParentTypeFather(void) {
    assert(GNParentTypeOutput(5) == kGNParentTypeFather);
    assert(GNParentTypeOutput(10) == kGNParentTypeFather);
}

// Cheking of Split Parent Type
void GNCheckParentTypeMotherFather(void) {
    assert(GNParentTypeOutput(15) == kGNParentTypeMotherFather);
    assert(GNParentTypeOutput(30) == kGNParentTypeMotherFather);
}

// Cheking Parent Type Undefined
void GNCheckParentTypeUndefined(void) {
    assert(GNParentTypeOutput(0) == kGNParentTypeUndefined);
    assert(GNParentTypeOutput(7) == kGNParentTypeUndefined);
}

// Cheking GNParentTypeOutput function during 1000 cycles
void GNParentTypeOutputLoopTest(void) {
    for (int count = 0; count < 1000; count++) {
        printf("The Number Of Counter: %i\n", count);
        GNParentTypeOutput(count);
    }
}
