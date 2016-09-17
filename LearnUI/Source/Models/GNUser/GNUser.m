//
//  GNUser.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUser.h"

#import "NSString+GNRandomName.h"

static NSString * const kGNImageName = @"user";
static NSString * const kGNImageType = @"jpg";

static NSString * const kGNName = @"name";
static NSString * const kGNSurname = @"surname";

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
    static UIImage * _image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:kGNImageName ofType:kGNImageType];
        _image = [UIImage imageWithContentsOfFile:path];
    });
    return _image;
}

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    sleep(1);
    [self image];
    self.state = kGNModelStateDidLoad;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kGNName];
    [aCoder encodeObject:self.surname forKey:kGNSurname];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kGNName];
        self.surname = [aDecoder decodeObjectForKey:kGNSurname];
    }
    
    return self;
}

@end
