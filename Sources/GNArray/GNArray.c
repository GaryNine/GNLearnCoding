//
//  GNArray.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include "GNArray.h"
#include "GNObject.h"

const uint8_t kGNArrayElementsLimit = 20;

struct Array {
    GNObject _super;
    void *_array[kGNArrayElementsLimit];
};