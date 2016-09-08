//
//  GNModelStateProtocol.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

@protocol GNModelObserverProtocol <NSObject>

@optional
- (void)modelUnload:(id)model;
- (void)modelIsLoading:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailWithLoading:(id)model;

@end