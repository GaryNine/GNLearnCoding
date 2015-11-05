//
//  GNMacroses.h
//  GNLearnC
//
//  Created by Igor Devyatko on 11/5/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNMacros_h
#define GNMacros_h

#define GNIvarGetterSyntesize(object, objectIvar, returnValue) \
        NULL != object ? object->_ ## objectIvar : returnValue;

#define GNObjectAssignSetter(object, objectIvar, inputValue) \
        if (NULL != object && object->_ ## objectIvar != inputValue) \
        object->_ ## objectIvar = inputValue;

#define GNObjectRetainSetter(object, objectIvar, inputValue) \
        if (NULL != object && object->_ ## objectIvar != inputValue) \
        GNObjectRelease(object->_ ## objectIvar); \
        GNObjectRetain(inputValue); \
        object->_ ## objectIvar = inputValue;

#endif
