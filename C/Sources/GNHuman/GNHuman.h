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
#include "GNArray.h"


extern const uint8_t kGNMaxChildren;
extern const uint8_t kGNinitialAge;

typedef struct GNHuman GNHuman;

typedef enum {
    kGNMale,
    kGNFemale
} GNGenderType;

extern
GNHuman *GNHumanCreate(GNGenderType gender);

extern
GNHuman *GNHumanWithParameters(GNGenderType gender, uint8_t age, GNString *name);

extern
GNHuman *GNHumanCreateChild(GNHuman *father, GNHuman *mother);

extern
GNString *GNHumanName(GNHuman *human);
extern
void GNHumanSetName(GNHuman *human, GNString *string);

extern
uint8_t GNHumanAge(GNHuman *human);
extern
void GNHumanSetAge(GNHuman *human, uint8_t age);

extern
uint8_t GNHumanChildrenCount(GNHuman *human);

extern
GNHuman *GNHumanPartner(GNHuman *human);

extern
GNHuman *GNHumanFather(GNHuman *human);

extern
GNHuman *GNHumanMother(GNHuman *human);

extern
GNArray *GNHumanChildren(GNHuman *human);

extern
GNGenderType GNHumanGender(GNHuman *human);

extern
void GNHumanDivorce(GNHuman *human);
extern
void GNHumanMarry(GNHuman *human, GNHuman *partner);

#endif
