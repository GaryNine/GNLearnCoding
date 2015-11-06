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
#include "GNMacros.h"
#include "GNHuman.h"

#define GNHumanRetainPartner(partnerMale, partnerFemale) \
        female->_partner = partnerMale; \
        GNObjectRetain(female); \
        male->_partner = partnerFemale;

#define GNHumanReleasePartner(partnerValue) \
        female->_partner = partnerValue; \
        GNObjectRelease(female); \
        male->_partner = partnerValue;

#pragma mark -
#pragma mark Private Declarations

const uint8_t kGNMaxChildren = 20;
const uint8_t kGNinitialAge = 1;

struct GNHuman {
    GNObject _super;
    GNHuman *_partner;
    GNHuman *_father;
    GNHuman *_mother;
    GNArray *_children;
    GNGenderType _gender;
    GNString *_name;
    uint8_t _age;
};

extern
void __GNHumanDeallocate(void *human);

extern
GNHuman *GNHumanCreate(GNGenderType gender);

static
void GNHumanSetGender(GNHuman *human, GNGenderType gender); //Is needed this method?

static
bool GNHumanIsAbleToAddChild(GNHuman *human);

static
void GNHumanSetFather(GNHuman *human, GNHuman *father);

static
void GNHumanSetMother(GNHuman *human, GNHuman *mother);

static
void GNHumanSetPartner(GNHuman *human, GNHuman *partner);

static
void GNHumanAddChild(GNHuman *human, GNHuman *child);

static
void GNHumanRemoveChildren(GNHuman *human);
static
void GNHumanRemoveChildAtIndex(GNHuman *human, uint8_t childIndex);

#pragma mark -
#pragma mmark Initializations & Deallocation

void __GNHumanDeallocate(void *human) {
    GNHumanSetName(human, NULL);
    GNHumanDevorce(human);
    GNHumanRemoveChildren(human);
    GNHumanSetFather(human, NULL);
    GNHumanSetMother(human, NULL);
    
    __GNObjectDeallocate(human);
}

GNHuman *GNHumanCreate(GNGenderType gender) {
    GNHuman *human = GNObjectCreateOfType(GNHuman);
    assert(NULL != human);
    
//    human->_gender = gender;
    GNHumanSetGender(human, gender);
    GNHumanSetAge(human, kGNinitialAge);

    return human;
}

GNHuman *GNHumanWithParameters(GNGenderType gender, uint8_t age, GNString *name) {
    GNHuman *human = GNHumanCreate(gender);
    GNHumanSetAge(human, age);
    GNHumanSetName(human, name);
    
    return human;
}

#pragma mark - 
#pragma mark Accessors

GNString *GNHumanName(GNHuman *human) {
    return GNIvarGetterSyntesize(human, name, NULL);
}

void GNHumanSetName(GNHuman *human, GNString *string) {
    GNObjectRetainSetter(human, name, string);
}

uint8_t GNHumanAge(GNHuman *human) {
    return GNIvarGetterSyntesize(human, age, 0);
}

void GNHumanSetAge(GNHuman *human, uint8_t age) {
    GNObjectAssignSetter(human, age, age);
}

GNHuman *GNHumanPartner(GNHuman *human){
    return GNIvarGetterSyntesize(human, partner, NULL);
}

GNHuman *GNHumanFather(GNHuman *human) {
    return GNIvarGetterSyntesize(human, father, NULL);
}

void GNHumanSetFather(GNHuman *human, GNHuman *father) {
    GNObjectAssignSetter(human, father, father);
}

GNHuman *GNHumanMother(GNHuman *human) {
    return GNIvarGetterSyntesize(human, mother, NULL);
}

void GNHumanSetMother(GNHuman *human, GNHuman *mother) {
    GNObjectAssignSetter(human, mother, mother);
}

GNArray *GNHumanChildren(GNHuman *human) {
    return GNIvarGetterSyntesize(human, children, NULL);
}

//void GNHumanSetChildren(GNHuman *human, GNArray *children) {
//    if (NULL != human && NULL != GNHumanChildren(human)) {
//        GNObjectRelease(human->_children);
//        GNObjectRetain(children);
//        human->_children = children;
//    }
//}

GNGenderType GNHumanGender(GNHuman *human) {
    return GNIvarGetterSyntesize(human, gender, 0);
}

#pragma mark - 
#pragma mark Public Implementations

uint8_t GNHumanChildrenCount(GNHuman *human) {
    return ((NULL != human) ? GNArrayObjectsCount(GNHumanChildren(human)) : 0);
}

void GNHumanDevorce(GNHuman *human) {
    GNHuman *partner = GNHumanPartner(human);
    if (NULL != human) {
        
        if (GNHumanPartner(human) != NULL) {
            
            GNHumanSetPartner(human, partner);
        }
    }
}

void GNHumanMarry(GNHuman *human, GNHuman *partner) {
    if (NULL != human && NULL != partner) {
        
        if (GNHumanGender(human) != GNHumanGender(partner)) {
            GNHumanDevorce(human);
            GNHumanDevorce(partner);
            
            GNHumanSetPartner(human, partner);
        }
    }
}

GNHuman *GNHumanCreateChild(GNHuman *father, GNHuman *mother) {
    if (NULL != father && NULL != mother) {
        
    }
    GNHuman *child = GNHumanCreate(kGNMale);
    GNHumanAddChild(father, child);
    GNHumanAddChild(mother, child);
    
    return child;
}

#pragma mark -
#pragma mark Private Implementations

void GNHumanSetGender(GNHuman *human, GNGenderType gender){
    if (NULL != human) {
        human->_gender = gender;
    }
}

void GNHumanSetPartner(GNHuman *human, GNHuman *partner) {
//    GNHuman *male = GNHumanGender(human) == kGNMale ? human : partner;
//    GNHuman *female = male == human ? partner : human;
    if (kGNMale == GNHumanGender(human)) {
        GNObjectRetainSetter(human, partner, partner);
    } else {
        GNObjectAssignSetter(human, partner, partner);
    }
//    
//    if (NULL == GNHumanPartner(male) && NULL == GNHumanPartner(female)) {
//        GNHumanRetainPartner(male, female);
//    } else GNHumanReleasePartner(NULL);
}

bool GNHumanIsAbleToAddChild(GNHuman *human) {
    if (NULL != human) {
        if (kGNMaxChildren > GNHumanChildrenCount(human)) {
            return true;
        }
    }
    
    return false;
}

void GNHumanAddChild(GNHuman *human, GNHuman *child) {
    if (NULL != human && NULL != child) {
        if (GNHumanIsAbleToAddChild(human) == true) {
            GNArrayAddObject(GNHumanChildren(human), child);
            
            if (GNHumanGender(human) == kGNMale) {
                GNHumanSetFather(child, human);
            }
            else {
                GNHumanSetMother(child, human);
            }
        }
        
    }
}

void GNHumanRemoveChildren(GNHuman *human) {
    if (NULL != human) {
        for (uint8_t childIndex = 0; childIndex < kGNMaxChildren; childIndex++) {
            GNHumanRemoveChildAtIndex(human, childIndex);
        }
    }
}

void GNHumanRemoveChildAtIndex(GNHuman *human, uint8_t childIndex) {
    if (NULL != human) {
        GNHuman *child = GNArrayObjectAtIndex(GNHumanChildren(human), childIndex);
        GNArrayRemoveObjectAtIndex(GNHumanChildren(human),childIndex);
  
        if (GNHumanGender(human) == kGNMale) {
            GNHumanSetFather(child, NULL);
        }
        else {
            GNHumanSetMother(child, NULL);
        }
    }
}

//TODO: think about random human creating for child
//TODO: write macros ObjectSetter
