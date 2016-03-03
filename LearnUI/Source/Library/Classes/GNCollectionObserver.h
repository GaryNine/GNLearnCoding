//
//  GNCollectionObserver.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GNCollectionObserver <NSObject>

@optional
- (void)collectionDidObjectAdd;
- (void)collectionDidObjectRemove;
- (void)collectiondidObjectInsert;
- (void)collectionDidObjectReplace;
- (void)collectionDidObjectExchange;
- (void)collectionDidObjectMove;

@end
