//
//  LZAFNetWorking.m
//  DataHandling
//
//  Created by 栗子 on 2019/4/17.
//  Copyright © 2019年 CB. All rights reserved.
//

#import "LZAFNetWorking.h"

@implementation LZAFNetWorking

/**
 get
 */
+ (void)sendGetNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict  successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
    [manager GET:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        successBlock(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error.localizedDescription);
    }];
}

/**
 post
 */
+(void)sendPostNetWorkWithUrl:(NSString *)url parameters:(NSDictionary *)dict successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
    [manager POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        successBlock(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error.localizedDescription);
    }];
    
}

@end
