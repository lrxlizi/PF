//
//  LZBaseTabBarViewController.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZBaseTabBarViewController.h"

@interface LZBaseTabBarViewController ()

@end

@implementation LZBaseTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.tabBar.barTintColor = [UIColor whiteColor];
    [UITabBar appearance].translucent = NO;
    [self setViewControllers];
}
- (void)viewWillLayoutSubviews{
    float height = self.tabBar.frame.size.height;//原49改为self.tabBar.frame.size.height(修正ios11问题)
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = height;
    tabFrame.origin.y = self.view.frame.size.height - height;
    self.tabBar.frame = tabFrame;
}

- (void)setViewControllers {
    //UITabBarController 数据源
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TabBarConfigure" ofType:@"plist"];
    NSArray *dataAry = [[NSArray alloc] initWithContentsOfFile:path];
    for (NSDictionary *dataDic in dataAry) {
        //每个tabar的数据
        Class classs = NSClassFromString(dataDic[@"class"]);
        NSString *title = dataDic[@"title"];
        NSString *imageName = dataDic[@"image"];
        NSString *selectedImage = dataDic[@"selectedImage"];
        NSString *badgeValue = dataDic[@"badgeValue"];
        NSString *storyBoardID = dataDic[@"storyBoardID"];
        [self addChildViewController:[self ittemChildViewController:classs storyBoardID:storyBoardID title:title imageName:imageName selectedImage:selectedImage badgeValue:badgeValue]];
    }
    self.selectedIndex = 0;
}

- (LZBaseNavigationViewController *)ittemChildViewController:(Class)classs storyBoardID:(NSString *)storyBoardID title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage badgeValue:(NSString *)badgeValue {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:storyBoardID];
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //title设置
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    vc.tabBarItem.title = title;
    
    //小红点
    vc.tabBarItem.badgeValue = badgeValue.intValue > 0 ? badgeValue : nil;
    
    //导航
    LZBaseNavigationViewController *nav = [[LZBaseNavigationViewController alloc] initWithRootViewController:vc];
    nav.navigationBar.topItem.title = title;
    [nav.rootVcAry addObject:classs];
    return nav;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

#pragma 设置小红点数值
//设置指定tabar 小红点的值
- (void)setBadgeValue:(NSString *)badgeValue index:(NSInteger)index {
    if (index + 1 > self.viewControllers.count || index < 0) {
        //越界或者数据异常直接返回
        return;
    }
    LZBaseNavigationViewController *base = self.viewControllers[index];
    if (base.viewControllers.count == 0) {
        return;
    }
    UIViewController *vc = base.viewControllers[0];
    vc.tabBarItem.badgeValue = badgeValue.intValue > 0 ? badgeValue : nil;
}




@end
