//
//  GNUser.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUser.h"

#import "NSString+GNRandomName.h"

@implementation GNUser

@dynamic fullName;
@dynamic image;

#pragma mark - 
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"metal" ofType:@"jpg"];
    return [UIImage imageWithContentsOfFile:path];
}

@end
