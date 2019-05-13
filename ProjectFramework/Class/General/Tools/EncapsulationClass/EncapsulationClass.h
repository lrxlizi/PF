//
//  EncapsulationClass.h
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EncapsulationClass : NSObject

//+ (LZBaseViewController *)baseViewControllerView:(UIView*)View;

//判断是不是X类型的手机
+ (BOOL)iPhoneNotchScreen;
//判断是否为空
+ (BOOL)isNullOrNilWithObject:(id)object;
/* 获取本地时间 */
+ (NSString *)getNowTime;

//计算文本的宽度
+ (float)getStringWidth:(NSString *)text andFont:(UIFont *)font;

//计算文本的高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width;

// 生成二维码
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize logoImage:(UIImage *)logoImage;

//手机号检验
+ (BOOL)verifyUserPhone:(NSString *)userPhone;

//跳转到登录页
//+(void)jumpLoginVC:(LZBaseViewController *)viewController;

//是否登录
//+(BOOL)isLogin;

//json字符串传字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


@end


NS_ASSUME_NONNULL_END
