//
//  GNOwnershipMacro.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNClangMacro.h"

#define GNWeakify(obj) \
__weak __typeof(obj) __weak_##obj = obj

#define GNStrongify(obj) \
    GNClangDiagnosticPushOption("clang diagnostic ignored \"-Wshadow\"") \
    __strong __typeof(obj) obj = __weak_##obj \
    GNClangDiagnosticPopOption

#define GNStrongifyAndReturnValueIfNil(obj, value) \
    GNStrongify(obj); \
    if(!obj) { \
        return value; \
    }

#define GNEmpty

#define GNStrongifyAndReturnIfNil(obj) \
    GNStrongifyAndReturnValueIfNil(obj, GNEmpty)

#define GNStrongifyAndReturnNilIfNil(obj) \
    GNStrongifyAndReturnValueIfNil(obj, nil)
