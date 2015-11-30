//
//  Protocol.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/29/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef Protocol_h
#define Protocol_h

@protocol GNBeingProtocol <NSObject>

@required

@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, readonly) NSSet           *children;
@property (nonatomic, assign)   int             *weight;
@property (nonatomic, assign)   int             *age;

- (id)performGenderSpecificOperation;

@optional

- (void)sayHello;

@end

#endif
