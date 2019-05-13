//
//  LZPfHUD.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/25.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZPfHUD.h"
#import "MBProgressHUD.h"

@implementation LZPfHUD

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message?message:@"加载中...";
    hud.labelFont=[UIFont systemFontOfSize:15];
    hud.color=[UIColor colorWithRed:17/255 green:17/255 blue:17/255 alpha:0.5];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    [self showTipMessage:message isWindow:true timer:1];
}
+ (void)showTipMessageInView:(NSString*)message
{
    [self showTipMessage:message isWindow:false timer:1];
}
+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:true timer:aTimer];
}
+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:false timer:aTimer];
}
+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:1];
}
#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message isWindow:true timer:0];
}
+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message isWindow:false timer:0];
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hide:YES afterDelay:aTimer];
    }
}
#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Error" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Info" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"MBHUD_Success" message:Message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:1];
    
    
}


+ (void)hideHUD {
    for (UIView *hud in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([hud isKindOfClass:[MBProgressHUD class]]) {
            MBProgressHUD *tempHud = (MBProgressHUD *)hud;
            tempHud.removeFromSuperViewOnHide = YES;
            [tempHud hide:YES];
        }
    }
    
    [MBProgressHUD hideHUDForView:[self getCurrentUIVC].view animated:YES];
}

+ (void)showToastMessage:(NSString *)Message point:(CGPoint)point
{
    UIView  *view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    [view bringSubviewToFront:hud];
    hud.userInteractionEnabled = NO;
    hud.labelText = Message;
    hud.mode = MBProgressHUDModeText;
    hud.color = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.backgroundColor = [UIColor clearColor];
    hud.cornerRadius = 3;
    hud.margin = 8;
    hud.yOffset = point.y;
    hud.xOffset = point.x;
    [hud show:YES];
    [hud hide:YES afterDelay:1.5];
}
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}

@end
