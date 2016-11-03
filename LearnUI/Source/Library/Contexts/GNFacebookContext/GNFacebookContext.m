//
//  GNFacebookContext.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFacebookContext.h"

#import "GNModel.h"
#import "GNOwnershipMacro.h"
#import "GNDispatch.h"

@interface GNFacebookContext ()
- (FBSDKGraphRequest *)request;
- (FBSDKGraphRequestHandler)completionHandler;

@end

@implementation GNFacebookContext

#pragma mark -
#pragma mark Initializations & Deallocations 

- (void)dealloc {
    self.connection = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        _connection = connection;
        [_connection start];
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    GNWeakify(self);
    GNDispatchAsyncOnMainQueue( ^{
        GNStrongifyAndReturnIfNil(self);
        self.connection = [[self request] startWithCompletionHandler:[self completionHandler]];
    });
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:[self graphPath]
                                             parameters:[self parameters]];
}

- (FBSDKGraphRequestHandler)completionHandler {
    GNWeakify(self);
    return ^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        GNStrongifyAndReturnIfNil(self);
        [self fillModelWithResult:result];
        
        GNModel *model = self.model;
        @synchronized (model) {
            model.state = kGNModelStateDidLoad;
        }
    };
}

- (NSString *)graphPath {
    return nil;
}

- (NSDictionary *)parameters {
    return nil;
}

- (void)fillModelWithResult:(NSDictionary *)result {
    
}

@end
