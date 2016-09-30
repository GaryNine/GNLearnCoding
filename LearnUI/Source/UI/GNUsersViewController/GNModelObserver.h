//
//  GNModelStateProtocol.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNArrayModelObserver.h"

@protocol GNModelObserver <NSObject>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailWithLoading:(id)model;

@end