//
//  LZAFNetWorking.h
//  DataHandling
//
//  Created by 栗子 on 2019/4/17.
//  Copyright © 2019年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSString *error);

@interface LZAFNetWorking : NSObject

/**
 get
 */
+ (void)sendGetNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict  successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;
/**
 post
 */
+(void)sendPostNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;



@end

NS_ASSUME_NONNULL_END
