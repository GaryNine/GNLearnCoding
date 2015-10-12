//
//  GNOutputParentType.c
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#include <stdio.h>
#include "GNParentTypeOutput.h"

#pragma mark -
#pragma mark Private Implementations

static const int kGNMotherDivisor = 3;
static const int kGNFatherDivisor = 5;

GNParentType GNParentTypeOutput(int value) {
   
    GNParentType result = kGNParentTypeUndefined;
    
    if (0 != value) {
        if (0 == value % kGNMotherDivisor) {
            printf("Mother");
            result = kGNParentTypeMother;
        }
        
        if (0 == value % kGNFatherDivisor) {
            printf("Father");
            result = (kGNParentTypeMother == result
                      ? kGNParentTypeMotherFather
                      : kGNParentTypeFather);
        }
        
        if (result != kGNParentTypeUndefined) {
            printf("\n");
        }
    }
    
    return result;
}
