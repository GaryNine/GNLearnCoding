//
//  GNHumanTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/18/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <assert.h>

#include "GNHumanTests.h"
#include "GNHuman.h"
#include "GNObject.h"
#include "GNString.h"

#pragma mark -
#pragma mark Private Declarations

static
void GNHumanCreateTests(void);

static
void GNHumanWithParametersTests(void);

static
void GNHumanMarryTests(void);

static
void GNHumanCreateChildTests(void);

#pragma mark - 
#pragma mark Public Implementations

void GNPerformHumanTests(void) {
    GNHumanCreateTests();
    GNHumanWithParametersTests();
    GNHumanMarryTests();
    GNHumanCreateChildTests();
}

#pragma mark -
#pragma mark Private Implementations

void GNHumanCreateTests(void) {
    //After human creating with default male gender:
    GNHuman *human = GNHumanCreate(kGNMale);
    
        //object must not be NULL
    assert(NULL != human);
    
        //object reference count must be equal 1
    assert(1 == GNObjectRetainCount(human));
    
        //object gender must be male
    assert(kGNMale == GNHumanGender(human));
    
        //object age must be equal initial age 1
    assert(kGNinitialAge == GNHumanAge(human));
    
        //object partner must be NULL
    assert(NULL == GNHumanPartner(human));
    
        //object father must be NULL
    assert(NULL == GNHumanFather(human));
    
        //object mother must be NULL
    assert(NULL == GNHumanMother(human));
    
        //object children count must be equal to 0
    assert(0 == GNHumanChildrenCount(human));
    
        //object name must be NULL
    assert(NULL == GNHumanName(human));
    
    GNObjectRelease(human);
}

void GNHumanWithParametersTests(void) {
    
    ///After human creating with parameters:
    GNString *name = GNStringCreate("Michelle");
    GNHuman *human = GNHumanWithParameters(kGNFemale, 21, name);
    
        //object must not be NULL
    assert(NULL != human);
    
        //object reference count must be equal 1
    assert(1 == GNObjectRetainCount(human));
    
        //object gender must be female
    assert(kGNFemale == GNHumanGender(human));
    
        // object age must be equal to the function argument
    assert(21 == GNHumanAge(human));
    
        //object partner must be NULL
    assert(NULL == GNHumanPartner(human));
    
        //object father must be NULL
    assert(NULL == GNHumanFather(human));
    
        //object mother must be NULL
    assert(NULL == GNHumanMother(human));
    
        //object children count must be equal to 0
    assert(0 == GNHumanChildrenCount(human));
    
        //object name must be equal to the name in the function argument
    assert(name == GNHumanName(human));
    
    GNObjectRelease(name);
    GNObjectRelease(human);
}

void GNHumanMarryTests(void) {
    
    GNString *maleName = GNStringCreate("Mark");
    GNString *femaleName = GNStringCreate("Michelle");
    GNHuman *human = GNHumanWithParameters(kGNMale, 28, maleName);
    GNHuman *partner = GNHumanWithParameters(kGNFemale, 25, femaleName);

    //After human marry:
    GNHumanMarry(human, partner);
    
        //objects must have a partner
    assert(NULL != GNHumanPartner(human));
    assert(NULL != GNHumanPartner(partner));
    
        //female reference count must be equal to 2
    assert(2 == GNObjectRetainCount(partner));
    
        //male reference count must be equal to 1
    assert(1 == GNObjectRetainCount(human));
    
    //After human devorce:
    GNHumanDevorce(human);
    
        //object must not have a partner
    assert(NULL == GNHumanPartner(human));
    assert(NULL == GNHumanPartner(partner));
    
        //female reference count must be equal to 1
    assert(1 == GNObjectRetainCount(partner));
    
    GNObjectRelease(maleName);
    GNObjectRelease(femaleName);
    GNObjectRelease(human);
    GNObjectRelease(partner);
}

void GNHumanCreateChildTests(void) {
    GNString *maleName = GNStringCreate("Mark");
    GNString *femaleName = GNStringCreate("Michelle");
    GNString *childName = GNStringCreate("Ben");
    GNHuman *father = GNHumanWithParameters(kGNMale, 28, maleName);
    GNHuman *mother = GNHumanWithParameters(kGNFemale, 25, femaleName);
    
    //After human create child:
    GNHuman * child = GNHumanCreateChild(father, mother);
    GNHumanSetName(child, childName);
    
        //object child must not be NULL
    assert(NULL != child);
    
        //object child must have male gender
    assert(kGNMale == GNHumanGender(child));
    
        //object child must not have a partner
    assert(NULL == GNHumanPartner(child));
    
        //object child must have a father
    assert(NULL != GNHumanFather(child));
    
        //object child must have a mother
    assert(NULL != GNHumanMother(child));
    
        //object age must be equal initial age 1
    assert(kGNinitialAge == GNHumanAge(child));
    
       //object children count must be equal to 0
    assert(0 == GNHumanChildrenCount(child));
    
       //object child reference count must be equal to 3
    assert(3 == GNObjectRetainCount(child));
    
        //object father must have children count equal to 1
    assert(1 == GNHumanChildrenCount(father));
    
        //object mother must have children count equla to 1
    assert(1 == GNHumanChildrenCount(mother));
    
    //After parents was released:
    GNObjectRelease(maleName);
    GNObjectRelease(femaleName);
    GNObjectRelease(father);
    GNObjectRelease(mother);
    
        //object must not have parents
    assert(NULL != GNHumanFather(child));
    assert(NULL != GNHumanMother(child));
    
    GNObjectRelease(childName);
    GNObjectRelease(child);
}

// write full user story(like i wrote at the begining)
