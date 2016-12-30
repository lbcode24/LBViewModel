//
//  HttpRequestTool.h
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API @"http://v.juhe.cn"

typedef void (^HttpRequestToolSuccessBlock)(id json);
typedef void (^HttpRequestToolFailedBlock)(id json);

@interface HttpRequestTool : NSObject

+ (NSMutableDictionary *)creatRequestDic;

+ (void)postRequestWithUrl:(NSString *)url
                    params:(NSDictionary *)params
                   success:(HttpRequestToolSuccessBlock)success
                    failed:(HttpRequestToolFailedBlock)failed;

+ (void)getRequestWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                  success:(HttpRequestToolSuccessBlock)success
                   failed:(HttpRequestToolFailedBlock)failed;

+ (void)uploadRequestWithUrl:(NSString *)url
                      params:(NSDictionary *)params
                     success:(HttpRequestToolSuccessBlock)success
                      failed:(HttpRequestToolFailedBlock)failed;
@end
