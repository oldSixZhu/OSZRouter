//
//  OSZRouter.m
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import "OSZRouter.h"


@implementation OSZRouter

#pragma mark - 单例
static OSZRouter *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

+ (instancetype)sharedManager {
    return [[self alloc]init];
}


#pragma mark - 跳转

- (void)pushViewControllerWithNativeURL:(NSString *)URL withParams:(NSDictionary *)param animated:(BOOL)Yes {
    if (!URL) {
        NSLog(@"url为空");
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OSZRouterConfig" ofType:@"plist"];
    NSDictionary *nameDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"---%@",nameDic);
    
    NSString *controllerName = nameDic[URL];
    UIViewController *controller = (UIViewController *)[[NSClassFromString(controllerName) alloc] init];
    controller.routerParams = param;
    controller.routerURL = URL;
    [[self rootViewController] pushViewController:controller animated:Yes];
}



- (UINavigationController *)rootViewController {
    id root = [[UIApplication sharedApplication].delegate window].rootViewController;
    //如果是navigationController
    if ([root isKindOfClass:[UINavigationController class]]) {
        return root;
    }else if ([root isKindOfClass:[UITabBarController class]]){
        //如果是tabbarVc
        UITabBarController *rootVc = root;
        UINavigationController *nav = nil;
        if (rootVc.childViewControllers.count > 0) {
            nav = rootVc.childViewControllers.firstObject;
        }
        return nav ? nav : [[UINavigationController alloc] init];
    }else{
        //如果根控制器是个UIViewController
        UIViewController *rootVc = root;
        
        UITabBarController *subTabVc = [[UITabBarController alloc] init];
        UINavigationController *rootNav = nil;
        for (id subVc in rootVc.childViewControllers) {
            //如果有一个子控制器是tabbarvc
            if ([subVc isKindOfClass:[UITabBarController class]]) {
                subTabVc = subVc;
                //并且里面有UINavigationController为子控制器
                if (subTabVc.childViewControllers.count > 0) {
                    rootNav = subTabVc.childViewControllers[subTabVc.selectedIndex];
                }
                break;
            }
        }
        return rootNav ? rootNav : [[UINavigationController alloc] init];
    }
}


@end
