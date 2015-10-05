//
//  GNOutputParentType.h
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#ifndef GNParentTypeOutput_h
#define GNParentTypeOutput_h

typedef enum {
    kGNParentTypeUndefined,
    kGNParentTypeMother,
    kGNParentTypeFather,
    kGNParentTypeMotherFather,
} GNParentType;

extern
GNParentType GNParentTypeOutput(int value);

#endif 
