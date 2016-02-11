//
//  GNCarWashProtocol.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/10/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GNCashProtocol <NSObject>

@required
@property (nonatomic, readonly)     NSUInteger  cash;

- (void)giveMoney:(NSUInteger)cash;
- (void)takeMoney:(NSUInteger)cash;

@optional
- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver;
- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver;

@end
