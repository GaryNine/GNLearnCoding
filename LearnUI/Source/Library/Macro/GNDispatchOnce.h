//
//  GNDispatchOnce.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#define GNDispatchOnce(type, result, block) \
{ \
static type *result = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
    if (block) { \
        result = block(); \
    } \
}); \
return result; \
}
