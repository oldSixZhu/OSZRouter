//
//  OSZRouter.h
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewController+RouterParams.h"

@interface OSZRouter : NSObject

+ (instancetype)sharedManager;

- (UINavigationController *)rootViewController;


- (void)pushViewControllerWithNativeURL:(NSString *)URL withParams:(NSDictionary *)param animated:(BOOL)Yes;


@end

