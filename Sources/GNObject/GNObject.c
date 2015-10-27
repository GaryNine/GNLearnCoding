//
//  GNObject.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/23/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <assert.h>

#include "GNObject.h"

#pragma mark - 
#pragma mark Public Implementations

void *GNObjectCreate(size_t size, GNObjectDeallocator deallocator) {
    assert(0 != size);
    assert(NULL != deallocator);
    
    GNObject *object = calloc(1, size);

    assert(NULL != object);
    
    object->_retainCount = 1;
    object->_deallocatorFunctionPointer = deallocator;
    
    return object;
}

void __GNObjectDeallocate(void *object) {
    if (NULL != object) {
        free(object);
    }
}

uint64_t GNObjectRetainCount(void *object) {
    return object ? ((GNObject *)object)->_retainCount : 0;
}

void GNObjectRelease(void *object) {
    if (NULL != object) {
        if (0 == --((GNObject*)object)->_retainCount) {
            GNObjectDeallocator deallocator = ((GNObject*)object)->_deallocatorFunctionPointer;
            
            deallocator(object);
        }
    }
}

void *GNObjectRetain(void *object) {
    if (NULL != object) {
        ((GNObject*)object)->_retainCount++;
    }
    
    return object;
}