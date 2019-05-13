//
//  EncapsulationClass.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "EncapsulationClass.h"

@implementation EncapsulationClass

//
//+ (LZBaseViewController *)baseViewControllerView:(UIView*)View{
//    for (UIView* next = [View superview]; next; next = next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[LZBaseViewController class]]) {
//            return (LZBaseViewController *)nextResponder;
//        }
//    }
//    return nil;
//}

+ (BOOL)iPhoneNotchScreen {
    if (__IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_11_0) {
        return false;
    } else {
        CGFloat iPhoneNotchDirectionSafeAreaInsets = 0;
        if (@available(iOS 11.0, *)) {
            UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;
            switch ([UIApplication sharedApplication].statusBarOrientation) {
                case UIInterfaceOrientationPortrait:{
                    iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top;
                }
                    break;
                case UIInterfaceOrientationLandscapeLeft:{
                    iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.left;
                }
                    break;
                case UIInterfaceOrientationLandscapeRight:{
                    iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.right;
                }
                    break;
                case UIInterfaceOrientationPortraitUpsideDown:{
                    iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.bottom;
                }
                    break;
                default:
                    iPhoneNotchDirectionSafeAreaInsets = safeAreaInsets.top;
                    break;
            }
        } else {
            // Fallback on earlier versions
        }
        return iPhoneNotchDirectionSafeAreaInsets > 20;
    }
}


//判断是否为空
+ (BOOL)isNullOrNilWithObject:(id)object;
{
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@""]||[object isEqualToString:@"(null)"]) {
            return YES;
        } else {
            return NO;
        }
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        if ([object isEqualToNumber:@0]) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}

/* 获取本地时间 */
+ (NSString *)getNowTime {
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}
//计算文本的宽度
+ (float)getStringWidth:(NSString *)text andFont:(UIFont*)font{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.width+1;
}

//计算文本的高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height+1;
    
  
    
    
}

// 生成二维码
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize logoImage:(UIImage *)logoImage{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
    return [[self alloc] createNonInterpolatedUIImageFormCIImage:outPutImage withSize:Imagesize waterImageSize:waterImagesize logoImage:logoImage];
}
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize logoImage:(UIImage *)logoImage{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //创建一个DeviceGray颜色空间
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitmapInfo：指定的位图应该包含一个alpha通道。
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    //创建CoreGraphics image
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage);
    
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    //给二维码加 logo 图
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //logo图
    UIImage *waterimage;
    if (![EncapsulationClass isNullOrNilWithObject:logoImage]) {
        waterimage = logoImage;
    }
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [waterimage drawInRect:CGRectMake((size-waterImagesize)/2.0, (size-waterImagesize)/2.0, waterImagesize, waterImagesize)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}


//手机号检验
+ (BOOL)verifyUserPhone:(NSString *)userPhone{
    NSString *phone = @"^[0-9]{11}$";
    
    NSPredicate *prePhone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phone];
    BOOL result = [prePhone evaluateWithObject:userPhone];
    if (result)
    {
        return YES;
    }
    return NO;
}

////跳转到登录页
//+(void)jumpLoginVC:(LZBaseViewController *)viewController{
//    LZLoginViewController *login =[LZLoginViewController new];
//    LZBaseNavigationViewController *nav = [[LZBaseNavigationViewController alloc] initWithRootViewController:login];
//    [viewController presentViewController:nav animated:YES completion:NULL];
//}
//
////是否登录
//+(BOOL)isLogin{
//    NSString *name = cbUserDefaultsGET(USER_NAME);
//    if (![EncapsulationClass isNullOrNilWithObject:name] || name.length>0) {
//        return YES;
//    }
//    return NO;
//    
//}

//json字符串传字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败========%@",err);
        return nil;
    }
    return dic;
}

@end
