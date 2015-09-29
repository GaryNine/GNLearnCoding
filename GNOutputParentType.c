//
//  GNOutputParentType.c
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#include <stdio.h>
#include "GNOutputParentType.h"

#pragma mark -
#pragma mark Private Implementations


GNParentType GNParentTypeOutput(int value) {
    int result = GNParentTypeUndefined;
    
    if (0 != value) {
        if (0 == value % kGNMotherDivisor) {
            printf("Mother");
            result = GNParentTypeMother;
        }
        
        if (0 == value % kGNFatherDivisor) {
            result  = (GNParentTypeMother == result
                       ? GNParentTypeMotherFather
                       : GNParentTypeFather);
            printf("Father");
        }
        
        if (GNParentTypeMother != result) {
            printf("\n");
        }
    }
    
    return result;
}




    
    


     
    