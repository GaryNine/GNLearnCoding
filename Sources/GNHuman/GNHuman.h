//
//  GNHumanObject.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/13/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNHumanObject_h
#define GNHumanObject_h

#include "GNString.h"

extern const uint8_t kGNMaxChildren;
extern const uint8_t kGNinitialAge;

typedef struct GNHuman GNHuman;

typedef enum {
    kGNMale,
    kGNFemale
} GNGenderType;

//Create | Deallocate
extern
void __GNHumanDeallocate(void *human); // name with two space

extern
GNHuman *GNHumanCreate(GNGenderType gender);

extern
GNHuman GNHumanWithParameters(GNGenderType gender, uint8_t age, GNString *name);

//Setters & Getters
extern
GNString *GNHumanName(GNHuman *human);
extern
void GNHumanSetName(GNHuman *human, GNString *string);

extern
uint8_t GNHumanAge(GNHuman *human);
extern
void GHHumanSetAge(GNHuman *human, uint8_t age);

extern
uint8_t GNHumanChildrenCount(GNHuman *human);

extern
void *GNHumanPartner(GNHuman *human);

extern
void *GNHumanFather(GNHuman *human);
extern
void GNHumanSetFather(GNHuman *human, GNHuman *father);

extern
void *GNHumanMother(GNHuman *human);
extern
void GNHumanSetMother(GNHuman *human, GNHuman *mother);

extern
GNGenderType GNHumanGender(GNHuman *human);
extern
void GNHumanSetGender(GNHuman *human, GNGenderType gender);

//Retain | Release
//static void GNObjectRetain(GNHuman *object);

//static void GNObjectRelease(GNHuman *object);

//Marry | Devorce
extern
void GNHumanSetPartner(GNHuman *human, GNHuman *partner);
extern
void GNHumanDevorce(GNHuman *human);
extern
void GNHumanMarry(GNHuman *human, GNHuman *partner);

//Add | Create | Remove (Children)
extern
bool GNIsHumanAddChild(GNHuman *human);
extern
void GNHumanAddChild(GNHuman *human, GNHuman *child);
extern
GNHuman *GNHumanCreateChild(GNHuman *father, GNHuman *mother);
extern
void GNHumanRemoveChildren(GNHuman *human);

#endif
