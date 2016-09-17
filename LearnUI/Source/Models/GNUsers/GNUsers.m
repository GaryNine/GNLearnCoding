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
#import "NSFileManager+GNExtensions.h"

#import "GNOwnershipMacro.h"

static const NSUInteger kGNInitialUsersCount = 7;

static NSString * const kGNArchiveFileName = @"objects.plist";

@interface GNUsers ()
@property (nonatomic, readonly) NSString    *archivePath;
@property (nonatomic, readonly) BOOL        cached;

- (NSArray *)loadUsers;

@end

@implementation GNUsers

@dynamic archivePath;
@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSString *)archivePath {
    return [[NSFileManager appStatePath] stringByAppendingPathComponent:kGNArchiveFileName];
}

- (BOOL)cached {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:self.archivePath];
}

#pragma mark -
#pragma mark Public

- (void)save {
    if (!self.cached) {
        [[NSFileManager defaultManager] createDirectoryAtPath:[NSFileManager appStatePath]
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.archivePath];
}

- (void)performBackgroundLoading {
    sleep(2);
    id users = [self loadUsers];
    [self performBlockWithoutNotifications:^{
        for (id user in users) {
            [self addObject:user];
        }
    }];

    self.state = kGNModelStateDidLoad;
}

#pragma mark -
#pragma mark Private

- (NSArray *)loadUsers {
    NSArray *users = nil;
    if (self.cached) {
        users = [NSKeyedUnarchiver unarchiveObjectWithFile:self.archivePath];
    }
    
    if(!users) {
        users = [GNUser objectsWithCount:kGNInitialUsersCount];
    }
    
    return users;
}

@end
