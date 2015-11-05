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
    char *_name;
};

#pragma mark -
#pragma mmark Initializations & Deallocation

void __GNStringDeallocate(void *string) {
    GNStringSetName(string, NULL);
    __GNObjectDeallocate(string);
}

GNString *GNStringCreate(char *name) {
    GNString *string = GNObjectCreateOfType(GNString);
    assert(NULL != string);
    
    GNStringSetName(string, name);
    
    return string;
}

#pragma mark -
#pragma mark Accessors

char *GNStringName(GNString *string) {
    return GNIvarGetterSyntesize(string, name, NULL);
}

void GNStringSetName(GNString *string, char *name) {
    if (NULL != string && GNStringName(string) != name) {
        if (NULL != string->_name) {
            free(string->_name);
            string->_name = NULL;
        }
        if (name) {
            string->_name = strdup(name); //strings always must copy
        }
    }
}

#pragma mark -
#pragma mark Public Implementations

uint8_t GNStringLength(GNString * string, char *name) {
    uint8_t stringLength = 0;
    if (NULL != string && NULL != name) {
        stringLength = strlen(name);
    }
    
    return stringLength;
}
