//
//  GNUser.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUser.h"
#import "GNUsers.h"

#import "GNImageModel.h"

#import "NSString+GNRandomName.h"

static NSString * const kGNFirstName  = @"firstName";
static NSString * const kGNLastName  = @"lastName";
static NSString * const kGNURL      = @"url";

static NSString * const kGNImageURL = @"https://pixabay.com/en/autobots-logo-logo-design-1625828/";

@implementation GNUser

@dynamic fullName;
@dynamic image;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)user {
    GNUser *user = [GNUser new];
    
    user.firstName = [NSString randomName];
    user.lastName = [NSString randomName];
    user.imageURL = [NSURL URLWithString:kGNImageURL];
    
    return user;
}

#pragma mark - 
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (GNImageModel *)image {
    return [GNImageModel imageWithURL:self.imageURL];
}

- (void)setFriends:(GNUsers *)friends {
    if (_friends != friends) {
        [_friends removeObserver:self];
        _friends = friends;
        [_friends addObject:self];
    }
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
    [aCoder encodeObject:self.firstName forKey:kGNFirstName];
    [aCoder encodeObject:self.lastName forKey:kGNLastName];
    [aCoder encodeObject:self.imageURL forKey:kGNURL];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.firstName = [aDecoder decodeObjectForKey:kGNFirstName];
        self.lastName = [aDecoder decodeObjectForKey:kGNLastName];
        self.imageURL = [aDecoder decodeObjectForKey:kGNURL];
    }
    
    return self;
}

@end
