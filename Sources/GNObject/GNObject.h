//
//  GNObject.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/23/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNObject_h
#define GNObject_h

#include <stdlib.h>

typedef void (*GNObjectDeallocator)(void *object);

typedef struct {
    uint64_t _retainCount;
    GNObjectDeallocator _deallocatorFunctionPointer;
} GNObject;

extern
void *GNObjectCreate(size_t size, GNObjectDeallocator deallocator);

extern
void __GNObjectDeallocate(void *object);

extern
uint64_t GNObjectRetainCount(void *object);

extern
void GNObjectRelease(void *object);
extern
void *GNObjectRetain(void *object);

#endif
