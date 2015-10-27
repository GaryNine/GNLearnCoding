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
#include <assert.h>

#include "GNObject.h"
#include "GNHuman.h"

#define GNHumanRetainPartner(partnerMale, partnerFemale) \
female->_partner = partnerMale; \
GNObjectRetain(female); \
male->_partner = partnerFemale;

#define GNHumanReleasePartner(partnerValue) \
female->_partner = partnerValue; \
GNObjectRelease(female); \
male->_partner = partnerValue;

#define GNIvarGetterSyntesize(humanIvar) \
NULL != human ? human->_ ## humanIvar : NULL;

#pragma mark - 
#pragma mark Private Declarations

const uint8_t kGNMaxChildren = 20;
const uint8_t kGNinitialAge = 1;

struct GNHuman {
    GNObject _super;
//    uint64_t _referenceCount;
    GNHuman *_partner;
    GNHuman *_father;
    GNHuman *_mother;
    GNHuman *_children[kGNMaxChildren];
    GNGenderType _gender;
    GNString *_name;
//    char *_name;
    uint8_t _age;

};

#pragma mark -
#pragma mmark Initializations & Deallocation

void __GNHumanDeallocate(void *human) {
    GNHumanSetName(human, NULL);
    GNHumanDevorce(human);
    GNHumanRemoveChildren(human);
    GNHumanSetFather(human, NULL);
    GNHumanSetMother(human, NULL);
    
//    free(human);
    __GNObjectDeallocate(human);
}

GNHuman *GNHumanCreate(GNGenderType gender) {
//    GNHuman *human = calloc(1, sizeof(GNHuman));
    GNHuman *human = GNObjectCreate(sizeof(GNHuman), __GNHumanDeallocate);
    assert(NULL != human);
    
//    human->_referenceCount = 1;
    GNHumanSetGender(human, gender);
    GHHumanSetAge(human, kGNinitialAge);

    return human;
}

GNHuman GNHumanWithParameters(GNGenderType gender, uint8_t age, GNString *name) {
    GNHuman *human = GNHumanCreate(gender);
    GHHumanSetAge(human, age);
    GNHumanSetName(human, name);
    
    return *human;
}

#pragma mark - 
#pragma mark Accessors

GNString *GNHumanName(GNHuman *human) {
    return NULL != human ? human->_name : NULL;
}

void GNHumanSetName(GNHuman *human, GNString *string) {
    if (NULL != human) {
        GNObjectRelease(human->_name);
        GNObjectRetain(string);
       
        human->_name = string;
    }
}

uint8_t GNHumanAge(GNHuman *human) {
        return NULL != human ? human->_age : 0;
}

void GHHumanSetAge(GNHuman *human, uint8_t age) {
    if (NULL != human && human->_age != age) {
        human->_age = age;
    }
}

uint8_t GNHumanChildrenCount(GNHuman *human) {
    uint8_t childrenCount = 0;
    if (NULL != human) {
        for (int childrenIndex = 0; childrenIndex < kGNMaxChildren; childrenIndex++) {
            if (human->_children[childrenIndex] != NULL) {
                childrenCount++;
            }
        }
    }
    
    return childrenCount;
}

void *GNHumanPartner(GNHuman *human){
    return GNIvarGetterSyntesize(partner);
//    return NULL != human ? human->_partner : NULL;
}

void *GNHumanFather(GNHuman *human) {
    return GNIvarGetterSyntesize(father);
//    return NULL != human ? human->_father : NULL;
}

void GNHumanSetFather(GNHuman *human, GNHuman *father) {
    if (NULL != human && NULL != father) {
        human->_father = father;
    }
}

void *GNHumanMother(GNHuman *human) {
    return GNIvarGetterSyntesize(mother);
//    return NULL != human ? human->_mother : NULL;   
}

void GNHumanSetMother(GNHuman *human, GNHuman *mother) {
    if (NULL != human && NULL != mother) {
        human->_mother = mother;
    }
}

GNGenderType GNHumanGender(GNHuman *human) {
    return NULL != human ? human->_gender : 0;      //write a macros
}

#pragma mark -
#pragma mark Public Implementations

//static void GNObjectRetain(GNHuman *human) {
//    if (NULL != human) {
//        human->_referenceCount++;
//    }
//}
//
//static void GNObjectRelease(GNHuman *human) {
//    if (NULL != human) {        
////        if (0 == --(human->_referenceCount)) {
////              __GNHumanDeallocate(human);
////        }
//        human->_referenceCount--;
//    }
//    if (0 == human->_referenceCount) {
//        __GNHumanDeallocate(human);
//    }
//}

// retain setter

void GNHumanSetGender(GNHuman *human, GNGenderType gender){
    if (NULL != human) {
        human->_gender = gender;
    }
}

void GNHumanSetPartner(GNHuman *human, GNHuman *partner) {
    GNHuman *male = GNHumanGender(human) == kGNMale ? human : partner;
    GNHuman *female = male == human ? partner : human;
    
    if (NULL == GNHumanPartner(male) && NULL == GNHumanPartner(female)) {
        GNHumanRetainPartner(male, female);
    } else GNHumanReleasePartner(NULL);
}

void GNHumanDevorce(GNHuman *human) {
    GNHuman *partner = GNHumanPartner(human);
    if (NULL != human) {
        
        if (GNHumanPartner(human) != NULL) {

            GNHumanSetPartner(human, partner);
            
//            GNHuman *male = human->_gender == kGNMale ? human : partner;
//            GNHuman *female = male == human ? partner : human;
//            
//            female->_partner = NULL;
//            GNReleaseObject(female);
//            male->_partner = NULL;
        }
    }
}

void GNHumanMarry(GNHuman *human, GNHuman *partner) {
    if (NULL != human && NULL != partner) {
       
        if (GNHumanGender(human) != GNHumanGender(partner)) {
            GNHumanDevorce(human);
            GNHumanDevorce(partner);
            
            GNHumanSetPartner(human, partner);

//            GNHuman *male = human->_gender == kGNMale ? human : partner;
//            GNHuman *female = male == human ? partner : human;
//     
//            female->_partner = male;
//            GNRetainObject(female);
//            male->_partner = female;
        }
    }
}

bool GNIsHumanAddChild(GNHuman *human) {
    if (GNHumanChildrenCount(human) < kGNMaxChildren) {
        return true;
    }
    
    return false;
}

void GNHumanAddChild(GNHuman *human, GNHuman *child) {
    if (NULL != human && GNIsHumanAddChild(human) == true) {
        for (int childIndex = 0; childIndex < kGNMaxChildren; childIndex++) {
            if (human->_children[childIndex] == NULL) {
                human->_children[childIndex] = child;
                child->_father = human;
                GNObjectRetain(child);
                
                return;
            }
        }
    }
}

GNHuman *GNHumanCreateChild(GNHuman *father, GNHuman *mother) {
    if (NULL != father && NULL != mother) {

    }
    GNHuman *child = GNHumanCreate(kGNMale);
    GNHumanSetFather(child, father);
    GNHumanSetMother(child, mother);
    GNHumanAddChild(father, child);
    GNHumanAddChild(mother, child);
    
    return child;
}

void GNHumanRemoveChildren(GNHuman *human) {
    if (NULL != human) {
        for (int childIndex = 0; childIndex < kGNMaxChildren; childIndex++) {
            GNHuman *child = human->_children[childIndex];
            if (NULL != child) {
                if (GNHumanGender(human) == kGNMale) {
                    GNHumanSetFather(child, NULL);
                } else  GNHumanSetMother(child, NULL);
            }
            // ternary operator
//            human->_gender == kGNMale ? GNHumanSetFather(child, NULL) : GNHumanSetMother(child, NULL);
            
            GNObjectRelease(child);
            human->_children[childIndex] = NULL;
        }
    }
}

//TODO: think about random human creating for child
//TODO: realize object and objectString
//TODO: realize objectArray
//TODO: write the tests

//TODO: write macros ObjectSetter


















