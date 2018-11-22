//
//  HomeController.m
//  OSZRouter
//
//  Created by fun on 2018/11/22.
//  Copyright © 2018 fun. All rights reserved.
//

#import "HomeController.h"
#import "OSZRouter.h"


@interface HomeController ()

@end


@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"主页";
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[OSZRouter sharedManager] pushViewControllerWithNativeURL:@"router://login" withParams:@{@"name" : @"哈哈",@"age":@"25"} animated:YES];
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
