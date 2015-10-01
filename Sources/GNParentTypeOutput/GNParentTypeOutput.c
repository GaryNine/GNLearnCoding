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

const int kGNMotherDivisor = 3;
const int kGNFatherDivisor = 5;

GNParentType GNParentTypeOutput(int value) {
   
    int result = GNParentTypeUndefined;
    
    if (0 != value) {
        if (0 == value % kGNMotherDivisor) {
            printf("Mother");
            result = GNParentTypeMother;
        }
        
        if (0 == value % kGNFatherDivisor) {
            printf("Father");
            result = (GNParentTypeMother == result
                  ? GNParentTypeMotherFather
                  : GNParentTypeFather);
        }
        
        if (result != GNParentTypeUndefined) {
            printf("\n");
        }
    }
    
    return result;
}
