//
//  GNHumanObject.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/13/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNHumanObject_h
#define GNHumanObject_h

extern const uint8_t kGNMaxChildren;
extern const uint8_t kGNinitialAge;

typedef struct GNHuman GNHuman;

typedef enum {
    kGNmale,
    kGNfemale
} GNGenderType;

//Create | Deallocate
extern
GNHuman *GNHumanCreate(GNGenderType gender);

extern
GNHuman GNHumanWithParameters(GNGenderType gender, uint8_t age, char *name);

extern
void __GNHumanDeallocate(GNHuman *human); // name with two space

//Setters & Getters
extern
char *GNHumanName(GNHuman *human);
extern
void GNHumanSetName(GNHuman *human, char *name);

extern
uint8_t GNHumanAge(GNHuman *human);
extern
void GHHumanSetAge(GNHuman *human, uint8_t *age);

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

//Retain | Release
extern
void GNRetainObject(GNHuman *object);
extern
void GNReleaseObject(GNHuman *object);

//Marry | Devorce
extern
void GNHumanMarry(GNHuman *human, GNHuman *partner);
extern
void GNHumanDevorce(GNHuman *human);

//Add | Create | Remove (Children)
extern
void GNAddChild(GNHuman *human, GNHuman *child);
extern
GNHuman GNCreateChild(GNHuman *father, GNHuman *mother);
extern
void GNRemoveChildren(GNHuman *human);

#endif
