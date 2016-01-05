//
//  GNCarWashProtocol.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/10/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNCashProtocol_h
#define GNCashProtocol_h

@protocol GNCashProtocol <NSObject>

@required
@property (nonatomic, readonly)     NSUInteger  cash;

- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver;
- (void)takeMoney:(NSUInteger)cash;

@optional
- (BOOL)isAbleToPayCash:(NSUInteger)cash;
- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver;

@end

#endif
