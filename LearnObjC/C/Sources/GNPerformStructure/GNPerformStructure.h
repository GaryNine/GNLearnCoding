//
//  GNStruct.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/4/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNStruct_h
#define GNStruct_h

#include <stdbool.h>

typedef struct {
    bool bool1;
    bool bool2;
    bool bool3;
    bool bool4;
    bool bool5;
    bool bool6;
    float floatValue;
    int intValue;
    long long llValue;
    short shortValue1;
    short shortValue2;
    short shortValue3;
    double doubleValue;
    char *string;
} GNSomeStructure;

typedef struct {
    char *string;
    double doubleValue;
    long long llValue;
    float floatValue;
    int intValue;
    short shortValue1;
    short shortValue2;
    short shortValue3;
    bool bool1;
    bool bool2;
    bool bool3;
    bool bool4;
    bool bool5;
    bool bool6;
} GNOptimizedStructure;

typedef struct {
    char *string;
    double doubleValue;
    long long llValue;
    float floatValue;
    int intValue;
    short shortValue1;
    short shortValue2;
    short shortValue3;
    
    union {
        char boolMarker;
        struct {
            bool bool1: 1;
            bool bool2: 1;
            bool bool3: 1;
            bool bool4: 1;
            bool bool5: 1;
            bool bool6: 1;
        };
    };
} GNUnionBoolStructure;

#endif 
