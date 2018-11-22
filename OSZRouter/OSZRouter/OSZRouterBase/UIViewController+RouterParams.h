//
//  UIViewController+RouterParams.h
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^reverseBlock)(id reverseValue);


@interface UIViewController (RouterParams)

@property (nonatomic, strong) NSDictionary *routerParams;
@property (nonatomic, strong) reverseBlock callBackBlock;
@property (nonatomic, strong) NSString *routerURL;

@end
