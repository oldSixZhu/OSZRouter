//
//  UIViewController+RouterParams.m
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import "UIViewController+RouterParams.h"
#import <objc/message.h>

static char *routerParamsKey = "routerParamsKey";
static char *reverseBlockKey = "reverseBlockKey";
static char *routerURLKey = "routerURLKey";



@implementation UIViewController (RouterParams)

- (NSDictionary *)routerParams{
    return objc_getAssociatedObject(self, routerParamsKey);
}

- (void)setRouterParams:(NSDictionary *)routerParams{
    objc_setAssociatedObject(self, routerParamsKey, routerParams, OBJC_ASSOCIATION_RETAIN);
}

- (reverseBlock)callBackBlock{
    return objc_getAssociatedObject(self, reverseBlockKey);
}

- (void)setCallBackBlock:(reverseBlock)callBackBlock{
    objc_setAssociatedObject(self, reverseBlockKey, callBackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)routerURL{
    return objc_getAssociatedObject(self, routerURLKey);
}

- (void)setRouterURL:(NSString *)routerURL {
    objc_setAssociatedObject(self, routerURLKey, routerURL, OBJC_ASSOCIATION_RETAIN);
}

@end
