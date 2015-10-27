//
//  GNString.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/26/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNString_h
#define GNString_h

typedef struct GNString GNString;

extern
void __GNStringDeallocate(void *string);

extern
GNString *GNStringCreate(char *name);

extern
char *GNStringName(GNString *string);

extern
void GNStringSetName(GNString *string, char *name);


#endif
