//
//  LZPfHUD.h
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/25.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZPfHUD : NSObject

/**纯文字*/
+ (void)showTipMessageInWindow:(NSString*)message;
+ (void)showTipMessageInView:(NSString*)message;
+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer;

/**loading*///
+ (void)showActivityMessageInWindow:(NSString*)message;
+ (void)showActivityMessageInView:(NSString*)message;
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer;
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer;

/**成功提示*/
+ (void)showSuccessMessage:(NSString *)Message;
/**错误提示*/
+ (void)showErrorMessage:(NSString *)Message;
/**文字+图片(信息提示)*/
+ (void)showInfoMessage:(NSString *)Message;
/**显示警告*/
+ (void)showWarnMessage:(NSString *)Message;

/**
 toast
 
 @param Message 信息
 @param point 指定距离中心点的X轴和Y轴的偏移量，如为0,0则在屏幕中间显示
 */
+ (void)showToastMessage:(NSString *)Message point:(CGPoint)point;


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;

//关闭   调用loading的时候在调用必须要用(其他的可不用)
+ (void)hideHUD;



@end

NS_ASSUME_NONNULL_END
