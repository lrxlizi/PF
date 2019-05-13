//
//  LZBaseNavigationViewController.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZBaseNavigationViewController.h"

@interface LZBaseNavigationViewController ()

@end

@implementation LZBaseNavigationViewController

- (void)loadView {
    [super loadView];
    
    //状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //导航背景颜色
    
   
    self.transferNavigationBarAttributes = YES;
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    //title颜色和字体
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],
                                               NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    // 分割线
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        [_lineView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        //        [self.navigationBar addSubview:_lineView];
    }
    [_lineView setFrame:CGRectMake(0, self.navigationBar.frame.size.height, self.navigationBar.frame.size.width, 0.5)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置导航栏背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"jifenjilu_dingbulan"] forBarMetrics:UIBarMetricsDefault];
    
    //设置状态栏背景
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏字体颜色和大小
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttrs];
    
}
#pragma mark -  push 设置
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    for (Class classes in self.rootVcAry) {
        if ([viewController isKindOfClass:classes]) {
            if (self.navigationController.viewControllers.count > 0) {
                viewController.hidesBottomBarWhenPushed = YES;
            } else {
                viewController.hidesBottomBarWhenPushed = NO;
            }
        } else {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark -  RootVc



- (NSMutableArray *)rootVcAry {
    if (!_rootVcAry) {
        _rootVcAry = [NSMutableArray new];
    }
    return _rootVcAry;
}

@end
