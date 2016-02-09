//
//  GNValueBitOutput.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/6/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNValueBitOutput_h
#define GNValueBitOutput_h

#include <stddef.h>

typedef enum {
    kGNEndianTypeLittleEndian,
    kGNEndianTypeBigEndian
} GNEndianType;

extern
void GNValueBitOutput(void *value, size_t sizeOfValue, GNEndianType endianType);

#endif
