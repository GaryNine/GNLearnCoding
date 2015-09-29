//
//  GNOutputParentType.h
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#ifndef __GNLearnC__GNOutputParentType__
#define __GNLearnC__GNOutputParentType__

#pragma mark -
#pragma mark Public Declarations

typedef enum {
    GNParentTypeMother,
    GNParentTypeFather,
    GNParentTypeMotherFather,
    GNParentTypeUndefined,
} GNParentType;

extern GNParentType GNParentTypeOutput();

const int kGNMotherDivisor = 3;
const int kGNFatherDivisor = 5;

#endif 
