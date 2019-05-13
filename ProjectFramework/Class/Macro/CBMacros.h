//
//  CBMacros.h
//  FirstAidBoxOperation
//
//  Created by 栗子 on 2019/3/27.
//  Copyright © 2019年 CB. All rights reserved.
//

/**
 * 本类放各种宏定义
 */

#ifndef CBMacros_h
#define CBMacros_h

// 屏幕尺寸
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 颜色(RGB)
#define RGBCOLOR(r, g, b)           [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define MAINREDCOLOR                [UIColor colorWithRed:0xd8 / 255.0 green:0x17 / 255.0 blue:0x18 / 255.0 alpha:1.0]//主题红色
#define MAINBLACKCOLOR              [UIColor colorWithRed:0x32 / 255.0 green:0x32 / 255.0 blue:0x32 / 255.0 alpha:1.0]//主题黑色
#define COLOR_NAV_VIEW              RGBACOLOR(34, 34, 34, 0.8)         //导航栏背景色

//状态栏样式
#define StatusBarStyle          UIStatusBarStyleDefault


//设备的UDID号
#define UDID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//本地储存
#define cbUserDefaultsGET(key)          [[NSUserDefaults standardUserDefaults] objectForKey:key]            // 取
#define cbUserDefaultsSET(object,key)   [[NSUserDefaults standardUserDefaults] setObject:object forKey:key] // 写
#define cbUserDefaultsSynchronize       [[NSUserDefaults standardUserDefaults] synchronize]                 // 存
#define cbUserDefaultsRemove(key)       [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]      // 删

// 中文字体
#ifdef Version9
#   define SC_PINGFANG_FONT(FONTSIZE)     [UIFont systemFontOfSize:(FONTSIZE)]
#else
#   define SC_PINGFANG_FONT(FONTSIZE)     [UIFont fontWithName:@"PingFangSC-Regular" size:(FONTSIZE)]
#endif



// 判断设备
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X ([EncapsulationClass iPhoneNotchScreen])

// 等比例尺寸
#define SCALEW SCREEN_WIDTH/375


#define USER_INFO @"USER_INFO"//存储用户的账号和密码


//weak object
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o##Strong = o;



#endif /* CBMacros_h */
