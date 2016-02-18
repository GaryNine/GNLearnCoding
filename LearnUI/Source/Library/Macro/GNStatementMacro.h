//
//  GNStatementMacro.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#define GNEmpty

#define GNReturnValueIfNil(statement, value) \
{ \
    if(!(statement)) { \
        return value; \
    } \
}

#define GNReturnIfNil(statement) GNReturnValueIfNil((statement), GNEmpty)

#define GNReturnNilIfNil(statement) GNReturnValueIfNil((statement), 0)
