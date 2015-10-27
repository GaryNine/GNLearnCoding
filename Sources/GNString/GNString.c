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

struct GNString {
    GNObject _super;
    char *_name;
};

void __GNStringDeallocate(void *string) {
    GNStringSetName(string, NULL);
    __GNObjectDeallocate(string);
}

GNString *GNStringCreate(char *name) {
    GNString *string = GNObjectCreate(sizeof(GNString), __GNStringDeallocate);
    assert(NULL != string);
    
    GNStringSetName(string, name);
    
    return string;
}

char *GNStringName(GNString *string) {
    return NULL != string ? string->_name : NULL;
}

void GNStringSetName(GNString *string, char *name) {
    if (NULL != string) {
        if (NULL != string->_name) {
            free(string->_name);
            string->_name = NULL;
        }
        if (name) {
            string->_name = strdup(name); //strings always must copy
        }
    }
}

