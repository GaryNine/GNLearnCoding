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
#import "GNModelObserverProtocol.h"

static const NSUInteger kGNInitialUsersCount = 7;

static NSString * const kGNArchiveFileName = @"objects.plist";

@interface GNUsers ()
@property (nonatomic, assign)   BOOL    cached;

- (void)fillWithUsers:(NSArray *)users;

@end

@implementation GNUsers

@dynamic archivePath;
@dynamic cached;

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kGNModelStateDidUnload;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)archivePath {
    return [[NSFileManager appStatePath] stringByAppendingPathComponent:kGNArchiveFileName];
}

- (BOOL)cached {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:[NSFileManager appStatePath]];
}

#pragma mark -
#pragma mark Public

- (void)save {
    [[NSFileManager defaultManager] createDirectoryAtPath:[NSFileManager appStatePath]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];
    
    [NSKeyedArchiver archiveRootObject:self.objects toFile:self.archivePath];
}

- (void)load {
    NSArray *users = nil;
    if (self.cached) {
        users = [NSKeyedUnarchiver unarchiveObjectWithFile:self.archivePath];
    }
    
    if(!users) {
        self.state = kGNModelStateWillLoad;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [self fillWithUsers:[GNUser objectsWithCount:kGNInitialUsersCount]];
            
            dispatch_sync(dispatch_get_main_queue(), ^ {
                [self cleanAfterProcessing];
            });

        });
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

- (void)cleanAfterProcessing {
    @synchronized (self) {
        self.state = kGNModelStateDidLoad;
    }
}

#pragma mark -
#pragma mark GNObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kGNModelStateDidUnload:
            return @selector(modelDidUnload:);
            
        case kGNModelStateWillLoad:
            return @selector(modelWillLoad:);
            
        case kGNModelStateDidLoad:
            return @selector(modelDidLoad:);
            
        case kGNModelStateDidFailWithLoading:
            return @selector(modelDidFailWithLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
