//
//  LZBaseNavigationViewController.h
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "RTRootNavigationController.h"
#import <RTRootNavigationController/RTRootNavigationController.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZBaseNavigationViewController : RTRootNavigationController

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic,strong) NSMutableArray *rootVcAry;


@end

NS_ASSUME_NONNULL_END
