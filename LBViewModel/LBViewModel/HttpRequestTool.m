//
//  HttpRequestTool.m
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "HttpRequestTool.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation HttpRequestTool

+ (NSMutableDictionary *)creatRequestDic {  //可以在这里加固定参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"83e859a71e7c14d416655a8fabb1393a" forKey:@"key"];
    return params;
}

//post请求
+ (void)postRequestWithUrl:(NSString *)url
                    params:(NSDictionary *)params
                   success:(HttpRequestToolSuccessBlock)success
                    failed:(HttpRequestToolFailedBlock)failed {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:true];
    manager.requestSerializer.timeoutInterval = 10.0;
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", API, url];

    [manager POST:requestUrl parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failed(error);
        }
    }];
}

//get请求
+ (void)getRequestWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                  success:(HttpRequestToolSuccessBlock)success
                   failed:(HttpRequestToolFailedBlock)failed {
    
}

//上传
+ (void)uploadRequestWithUrl:(NSString *)url
                      params:(NSDictionary *)params
                     success:(HttpRequestToolSuccessBlock)success
                      failed:(HttpRequestToolFailedBlock)failed {
    
}


@end
