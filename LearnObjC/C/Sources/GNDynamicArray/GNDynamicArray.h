//
//  GNDynamicArray.h
//  GNLearnC
//
//  Created by Igor Devyatko on 11/5/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNDynamicArray_h
#define GNDynamicArray_h

#include <stdbool.h>

typedef struct GNDynamicArray GNDynamicArray;

extern
void __GNDynamicArrayDeallocate(void *array);
extern
GNDynamicArray GNDynamicArrayCreateWithCount(void);

extern
uint8_t GNDynamicArrayCount(GNDynamicArray);

bool GNDynamicArrayResizeIfNeeded(GNDynamicArray *array);

extern
void GNDynamicArraySetCapacity(GNDynamicArray *array, uint16_t capacity) {
    
}




#endif
