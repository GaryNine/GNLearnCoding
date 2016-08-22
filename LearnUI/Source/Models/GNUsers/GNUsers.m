//
//  GNUsers.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsers.h"
#import "GNUser.h"

#import "NSObject+GNExtensions.h"

#import "GNOwnershipMacro.h"

static const NSUInteger kGNInitialUsersCount = 7;

static NSString * const kGNObjectsKey = @"objects";
static NSString * const kGNArchiveFileName = @"objects.plist";

@interface GNUsers ()

- (void)fillWithUsers:(NSArray *)users;

@end

@implementation GNUsers

@dynamic archivePath;

#pragma mark -
#pragma mark Initializations & Deallocation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self fillWithUsers:[GNUser objectsWithCount:kGNInitialUsersCount]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)archivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:kGNArchiveFileName];
}

#pragma mark -
#pragma mark Public

- (void)saveObjects {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.archivePath];
}

- (void)loadObjects {
    NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:self.archivePath];
    
    if(!users) {
        [self fillWithUsers:[GNUser objectsWithCount:kGNInitialUsersCount]];
    }
}

#pragma mark -
#pragma mark Private

- (void)fillWithUsers:(NSArray *)users {
    GNWeakify(self);
    [self performBlockWithoutNotifications:^{
        GNStrongify(self);
        for (id user in users) {
            [self addObject:user];
        }
    }];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.objects forKey:kGNObjectsKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        [self fillWithUsers:[aDecoder decodeObjectForKey:kGNObjectsKey]];
    }
    
    return self;
}

@end
