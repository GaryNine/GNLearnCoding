//
//  GNObjectTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <assert.h>

#include "GNObjectTests.h"
#include "GNObject.h"

void GNPerformGNObjectTests(void) {
    GNObject *object = __GNObjectCreate(sizeof(GNObject), __GNObjectDeallocate);
    
    assert(NULL != object);
    assert(1 == GNObjectRetainCount(object));
    
    GNObjectRetain(object);
    assert(2 == GNObjectRetainCount(object));
    
    GNObjectRelease(object);
    assert(1 == GNObjectRetainCount(object));
    
    GNObjectRelease(object);
    
}