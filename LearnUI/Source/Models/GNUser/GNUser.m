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
#import "NSCoder+GNExtensions.h"

#import "GNConstantStringMacro.h"

GNConstant(kGNUserID, @"userID")
GNConstant(kGNFirstName, @"firstName")
GNConstant(kGNLastName, @"lastName")
GNConstant(kGNURL, @"url")
GNConstant(kGNGender, @"gender")
GNConstant(kGNBirthday, @"birthday")
GNConstant(kGNEmail, @"email")

@implementation GNUser

@dynamic fullName;
@dynamic image;

#pragma mark -
#pragma mark initializations & Deallocations

- (instancetype)init {
    self = [super init];
    
    self.friends = [GNUsers new];
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

//- (GNImageModel *)image {
//    return [GNImageModel imageWithURL:self.imageURL];
//}
//
//#pragma mark -
//#pragma mark Public
//
//- (void)performBackgroundLoading {
//    sleep(1);
//    [self.image load];
//}

#pragma mark -
#pragma mark NSCoding


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObjects:@{kGNFirstName : self.firstName,
                            kGNLastName : self.lastName,
                            kGNURL : self.imageURL,
                            kGNGender : self.gender,
                            kGNBirthday : self.birthday,
                            kGNEmail : self.email,
                            kGNUserID : self.userID}];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.firstName = [aDecoder decodeObjectForKey:kGNFirstName];
        self.lastName = [aDecoder decodeObjectForKey:kGNLastName];
        self.imageURL = [aDecoder decodeObjectForKey:kGNURL];
        self.gender = [aDecoder decodeObjectForKey:kGNGender];
        self.birthday = [aDecoder decodeObjectForKey:kGNBirthday];
        self.email = [aDecoder decodeObjectForKey:kGNEmail];
        self.userID = [aDecoder decodeObjectForKey:kGNUserID];
    }
    
    return self;
}

@end
