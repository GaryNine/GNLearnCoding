//
//  GNHumanObject.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/13/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//


#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stddef.h>
#include <string.h>

#include "GNHuman.h"

#pragma mark - 
#pragma mark Private Declarations

const uint8_t kGNMaxChildren = 20;
const uint8_t kGNinitialAge = 1;

struct GNHuman {
    uint64_t _referenceCount;
    GNGenderType _gender;
    uint8_t _age;
    char *_name;
    GNHuman *_partner;
    GNHuman *_father;
    GNHuman *_mother;
    GNHuman *_childrens[kGNMaxChildren];
};

#pragma mark -
#pragma mmark Initializations & Deallocation

GNHuman *GNHumanCreate(GNGenderType gender) {
    GNHuman *human = calloc(1, sizeof(GNHuman));
    human->_referenceCount++;
    human->_gender = gender;
    human->_age = kGNinitialAge;

    return human;
}

GNHuman GNHumanWithParameters(GNGenderType gender, uint8_t age, char *name) {
    GNHuman *human = GNHumanCreate(gender);
    human->_age = age;
    human->_name = name;
    
    return *human;
}

void __GNHumanDeallocate(GNHuman *human) {
    human->_name = NULL;
    GNHumanDevorce(human);
    GNRemoveChildren(human);
    
    free(human);
}

#pragma mark - 
#pragma mark Accessors

char *GNHumanName(GNHuman *human) {
    
    return (NULL != human ? human->_name : NULL);
}

void GNHumanSetName(GNHuman *human, char *name) {
    if (NULL != human) {
        
        if (NULL != human->_name) {
            free(human->_name);
            human->_name = NULL;
        }
        
        if (name) {
            human->_name = strdup(name);
        }
    }
}

uint8_t GNHumanAge(GNHuman *human) {
    
    return (NULL != human ? human->_age : 0);
}

void GHHumanSetAge(GNHuman *human, uint8_t *age) {
    if (NULL != human) {
        human->_age = *age;
    }
}

uint8_t GNHumanChildrenCount(GNHuman *human) {
    uint8_t childrenCount = 0;
    if (NULL != human) {
        for (int childrenIndex = 0; childrenIndex < kGNMaxChildren; childrenIndex++) {
            
            if (human->_childrens[childrenIndex] != NULL) {
                childrenCount++;
            }
        }
    }
    
    return childrenCount;
}

void *GNHumanPartner(GNHuman *human){
    
    return (NULL != human ? human->_partner : NULL);
}

void *GNHumanFather(GNHuman *human) {
    
      return (NULL != human ? human->_father : NULL);
}

void GNHumanSetFather(GNHuman *human, GNHuman *father) {
    if (NULL != human && NULL != father) {
        human->_father = father;
    }
}

void *GNHumanMother(GNHuman *human) {
    
    return (NULL != human ? human->_mother : NULL);
}

void GNHumanSetMother(GNHuman *human, GNHuman *mother) {
    if (NULL != human && NULL != mother) {
        human->_mother = mother;
    }
}

#pragma mark -
#pragma mark Public Implementations

void GNRetainObject(GNHuman *human) {
     human->_referenceCount++;
}

void GNReleaseObject(GNHuman *human) {
    human->_referenceCount--;
    if (human->_referenceCount == 0) {
        __GNHumanDeallocate(human);
    }
}

void GNHumanDevorce(GNHuman *human) {
    GNHuman *partner = human->_partner;
    if (NULL != human) {
        
        if (human->_partner != NULL) {
            
            //write a macros GNHuman GenderIdentification
            GNHuman *male = human->_gender == kGNmale ? human : partner;
            GNHuman *female = male == human ? partner : human;
            
            female->_partner = NULL;
            GNReleaseObject(female);
            male->_partner = NULL;
        }
    }
}

void GNHumanMarry(GNHuman *human, GNHuman *partner) {
    if (NULL != human && NULL != partner) {
       
        if (human->_gender != partner->_gender) {
            GNHumanDevorce(human);
            GNHumanDevorce(partner);
            
            // write a macros GNHuman GenderIdentification
            GNHuman *male = human->_gender == kGNmale ? human : partner;
            GNHuman *female = male == human ? partner : human;
            
            female->_partner = male;
            GNRetainObject(female);
            male->_partner = female;
        }
    }
}

void GNAddChild(GNHuman *human, GNHuman *child) {
    if (NULL != human) {
        for (int childIndex = 0; childIndex < kGNMaxChildren; childIndex++) {
            
            if (human->_childrens[childIndex] == NULL) {
                human->_childrens[childIndex] = child;
                child->_father = human;
                GNRetainObject(child);
                
                return;
            }
        }
    }
}

GNHuman GNCreateChild(GNHuman *father, GNHuman *mother) {
    GNHuman *child = GNHumanCreate(kGNmale);
    GNHumanSetFather(child, father);
    GNHumanSetMother(child, mother);
    GNAddChild(father, child);
    GNAddChild(mother, child);
    
    return *child;
}

void GNRemoveChildren(GNHuman *human) {
    if (NULL != human) {
        for (int childIndex = 0; childIndex < kGNMaxChildren; childIndex++) {
            GNHuman *child = human->_childrens[childIndex];
                
            if (human->_gender == kGNmale) {
                    GNHumanSetFather(child, NULL);
            }
            
            else if (human->_gender == kGNfemale) {
                    GNHumanSetMother(child, NULL);
            }
            
             if (NULL != child) {
                GNReleaseObject(child);
            }
            
            human->_childrens[childIndex] = NULL;
        }
    }
}

//TODO: think about random human creating for child
