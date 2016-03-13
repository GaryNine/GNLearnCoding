//
//  GNUser.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "GNObservableObject.h"

@interface GNUser : GNObservableObject <NSCoding>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *surname;
@property (nonatomic, readonly) NSString    *fullName;
@property (nonatomic, readonly) UIImage     *image;

@end
