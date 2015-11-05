//
//  GNArray.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNArray_h
#define GNArray_h

#include <stdlib.h>
#include <stdbool.h>

typedef struct GNArray GNArray;

extern
void __GNArrayDeallocate(void *array);

extern
GNArray *GNArrayCreate(void);

extern
void *GNArrayObjectAtIndex(GNArray *array, uint8_t objectIndex);

extern
uint8_t GNArrayObjectsCount(GNArray *array);

extern
void GNArrayAddObject(GNArray *array, void *object);

extern
void GNArrayRemoveObjects(GNArray *array);

extern
void GNArrayRemoveObjectAtIndex(GNArray *array, uint8_t objectIndex);

#endif
