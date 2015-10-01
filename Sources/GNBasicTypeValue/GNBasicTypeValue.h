//
//  GNBasicTypeValue.h
//  GNLearnC
//
//  Created by Igor Devyatko on 9/28/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNBasicTypeValue_h
#define GNBasicTypeValue_h

#define GNBasicTypeValue(type, specifier) \
    void output_ ## type(type value) { \
        printf("The Value of Basic Type " #type ": " #specifier "\n", value); \
    }

#define GNBasicTypeOutput(type, value) output_ ## type(value);

#endif
