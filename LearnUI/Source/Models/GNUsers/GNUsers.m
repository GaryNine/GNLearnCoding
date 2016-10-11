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
@property (nonatomic, strong)   id  changeObserver;

- (NSArray *)loadUsers;

- (void)beginObservation;
- (void)finishObservation;

@end

@implementation GNUsers

@dynamic path;

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [self finishObservation];
}

- (instancetype)init {
    self = [super init];
    [self beginObservation];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [[NSFileManager appStatePath] stringByAppendingPathComponent:kGNArchiveFileName];
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
    
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.path];
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
        users = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    }
    
    if(!users) {
        users = [GNUser objectsWithCount:kGNInitialUsersCount];
    }
    
    return users;
}

- (void)beginObservation {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    GNWeakify(self);
    self.changeObserver = [center addObserverForName:(UIApplicationDidEnterBackgroundNotification)
                                              object:nil
                                               queue:[NSOperationQueue mainQueue]
                                          usingBlock:^(NSNotification * note) {
                                              GNStrongify(self);
                                              [self save];
                                          }];
}

- (void)finishObservation {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self.changeObserver
                      name:(UIApplicationDidEnterBackgroundNotification)
                    object:nil];
}

@end
