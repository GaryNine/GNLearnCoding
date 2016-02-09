//
//  GNDynamicArray.c
//  GNLearnC
//
//  Created by Igor Devyatko on 11/5/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include "GNObject.h"
#include "GNDynamicArray.h"

struct GNDynamicArray {
    GNObject _super;
    void **data;
    uint8_t count;
    uint8_t capacity;
};


