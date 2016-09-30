//
//  GNUser.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUser.h"

#import "GNImageModel.h"

#import "NSString+GNRandomName.h"

static NSString * const kGNName     = @"name";
static NSString * const kGNSurname  = @"surname";
static NSString * const kGNURL      = @"url";

static NSString * const kGNImageURL = @"https://pixabay.com/en/autobots-logo-logo-design-1625828/";

@implementation GNUser

@dynamic fullName;
@dynamic image;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)user {
    GNUser *user = [GNUser new];
    
    user.name = [NSString randomName];
    user.surname = [NSString randomName];
    user.imageURL = [NSURL URLWithString:kGNImageURL];
    
    return user;
}

#pragma mark - 
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (GNImageModel *)image {
    return [GNImageModel imageWithURL:self.imageURL];
}

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    sleep(1);
    [self.image load];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kGNName];
    [aCoder encodeObject:self.surname forKey:kGNSurname];
    [aCoder encodeObject:self.imageURL forKey:kGNURL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kGNName];
        self.surname = [aDecoder decodeObjectForKey:kGNSurname];
        self.imageURL = [aDecoder decodeObjectForKey:kGNURL];
    }
    
    return self;
}

@end
