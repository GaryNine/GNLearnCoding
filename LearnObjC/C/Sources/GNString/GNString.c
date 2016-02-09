//
//  GNString.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <string.h>
#include <assert.h>

#include "GNString.h"
#include "GNObject.h"
#include "GNMacros.h"

struct GNString {
    GNObject _super;
    char *_data;
};

#pragma mark -
#pragma mmark Initializations & Deallocation

void __GNStringDeallocate(void *string) {
    GNStringSetName(string, NULL);
    __GNObjectDeallocate(string);
}

GNString *GNStringCreate(char *data) {
    GNString *string = GNObjectCreateOfType(GNString);
    assert(NULL != string);
    
    GNStringSetName(string, data);
    
    return string;
}

#pragma mark -
#pragma mark Accessors

char *GNStringName(GNString *string) {
    return GNIvarGetterSyntesize(string, data, NULL);
}

void GNStringSetName(GNString *string, char *data) {
    if (NULL != string && GNStringName(string) != data) {
        if (NULL != string->_data) {
            free(string->_data);
            string->_data = NULL;
        }
        if (data) {
            assert(string->_data = strdup(data)); //strings always must copy
        }
    }
}

#pragma mark -
#pragma mark Public Implementations

uint8_t GNStringLength(GNString * string) {
    char *data = GNStringName(string);
    
    return data ? strlen(data) : 0;
    
}
