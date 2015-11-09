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
const uint8_t kGNObjectNotFound    = 0;

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
        object = array->_array[objectIndex];
    }
    
     return object;
}

uint8_t GNArrayIndexOfObject(GNArray *array, void *object) {
    uint8_t result = kGNObjectNotFound;
    
    if (GNArrayContainObject(array, object)) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (GNArrayObjectAtIndex(array, objectIndex) == object) {
                result = objectIndex;
                
                break;
            }
        }
    }
    
    return result;
}

bool GNArrayContainObject(GNArray *array, void *object) {
    if (NULL != array && NULL != object) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
           void *arrayObject = GNArrayObjectAtIndex(array, objectIndex);
           
            if (arrayObject == object) {
                return true;
            }
        }
    }
    
    return false;
}

uint8_t GNArrayObjectCount(GNArray *array) {
    uint8_t objectCount = 0;
    
    if (NULL != array) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (array->_array[objectIndex] != NULL) {
                objectCount++;
            }
        }
    }
    
    return objectCount;
}

#pragma mark -
#pragma mark Public Implementations

void GNArrayAddObject(GNArray *array, void *object) {
    if (NULL != array && false == GNArrayContainObject(array, object)) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (GNArrayObjectAtIndex(array, objectIndex) == NULL) {
                GNObjectRetain(object);
                array->_array[objectIndex] = object;
                
                return;
            }
        }
    }
}

void GNArrayRemoveObject(GNArray *array, void *object) {
    if (NULL != array && NULL != object) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            if (GNArrayObjectAtIndex(array, objectIndex) == object) {
                GNObjectRelease(object);
                array->_array[objectIndex] = NULL;
                
                return;
            }
        }
    }
}

void GNArraySetObjectAtIndex(GNArray *array, void *object, uint8_t objectIndex) {
    if (NULL != array && NULL != object) {
        GNObjectRelease(GNArrayObjectAtIndex(array, objectIndex));
        GNObjectRetain(object);
        array->_array[objectIndex] = object;
    }
}

void GNArrayRemoveObjectAtIndex(GNArray *array, uint8_t objectIndex) {
    assert(GNArrayObjectCount(array) > objectIndex);
    
    void *object = GNArrayObjectAtIndex(array, objectIndex);
    
    if (NULL != object) {
        GNObjectRelease(object);
        array->_array[objectIndex] = NULL;
    }
}

void GNArrayRemoveObjects(GNArray *array) {
    if (NULL != array) {
        for (uint8_t objectIndex = 0; objectIndex < kGNArrayObjectsLimit; objectIndex++) {
            GNArrayRemoveObjectAtIndex(array, objectIndex);
        }
    }
}
