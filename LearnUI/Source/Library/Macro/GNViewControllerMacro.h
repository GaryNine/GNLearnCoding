//
//  GNMacro.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#define GNBaseViewProperty(viewClass, propertyName) \
@property (nonatomic, readonly) viewClass   *propertyName;

#define GNBaseViewGetterSynthesize(viewClass, selector) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
    \
        return nil; \
}

#define GNViewControllerBaseViewProperty(viewControllerClass, viewClass, propertyName) \
    @interface viewControllerClass () \
    GNBaseViewProperty(propertyName, viewClass) \
    \
    @end \
    \
    @implementation viewControllerClass \
    @dynamic propertyName; \
    \
    GNBaseViewGetterSynthesize(viewClass, propertyName) \
    \
    @end

