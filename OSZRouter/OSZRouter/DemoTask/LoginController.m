//
//  LoginController.m
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import "LoginController.h"
#import "UIViewController+RouterParams.h"


@interface LoginController ()

@end


@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    self.title = @"登录";
    NSLog(@"传入的参数是%@,传入的url是:%@",self.routerParams,self.routerURL);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
