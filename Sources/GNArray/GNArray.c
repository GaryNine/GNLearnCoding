//
//  GNArray.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <assert.h>

#include "GNArray.h"
#include "GNObject.h"

const uint8_t kGNArrayObjectsLimit = 20;

struct GNArray {
    GNObject _super;
    void *_array[kGNArrayObjectsLimit];
};

#pragma mark -
#pragma mmark Initializations & Deallocation

void __GNArrayDeallocate(void *array) {
    GNArrayRemoveObjects(array);
    __GNObjectDeallocate(array);
}

GNArray *GNArrayCreate(void) {
    GNArray *array = GNObjectCreateOfType(GNArray);
    assert(NULL != array);
    
    return array;
}

#pragma mark -
#pragma mark Accessors

void *GNArrayObjectAtIndex(GNArray *array, uint8_t objectIndex) {
    void *object = NULL;
    if (NULL != array && kGNArrayObjectsLimit > objectIndex) {
        array->_array[objectIndex] = object;
    }
    
     return object;
}

#pragma mark -
#pragma mark Public Implementations

uint8_t GNArrayObjectsCount(GNArray *array) {
    uint8_t objectsCount = 0;
    if (NULL != array) {
        for (int objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (array->_array[objectIndex] != NULL) {
                objectsCount++;
            }
        }
    }
    
    return objectsCount;
}

void GNArrayAddObject(GNArray *array, void *object) {
    if (NULL != array && NULL != object) {
        for (int objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (GNArrayObjectAtIndex(array, objectIndex) == NULL) {
                array->_array[objectIndex] = object;
                GNObjectRetain(object);
                
                return;
            }
        }
    }
}

void GNArrayRemoveObjects(GNArray *array) {
    if (NULL != array) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            GNArrayRemoveObjectAtIndex(array, objectIndex);
        }
    }
}

void GNArrayRemoveObjectAtIndex(GNArray *array, uint8_t objectIndex) {
    assert(GNArrayObjectsCount(array) > objectIndex);
    
    void *object = GNArrayObjectAtIndex(array, objectIndex);
    
    if (NULL != object) {
        GNObjectRelease(object);
        array->_array[objectIndex] = NULL;
    }
}
