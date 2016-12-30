//
//  LBViewModel.h
//  LBViewModel
//
//  Created by LiuBang on 2016/12/27.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *  ViewModel的数据回调代理
 */
@protocol LBViewModelDelegate <NSObject>

/*
 *  请求成功后的回调代理（必需）
 */
@required
- (void)correctRequestDataWithViewModel:(id)data
                             resultCode:(NSInteger)resultCode;

/*
 *  请求失败的回调代理（可选）
 */
@optional
- (void)faildRequestWithError:(id)json;

@end

@interface LBViewModel : NSObject

@property (nonatomic, assign) id<LBViewModelDelegate> delegate;

@end

/*
 *  数据模型model基类，可将解析后的json影射到model中
 */
@interface BaseModel : NSObject

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

/*
 *  通用的第一层数据
 */
@interface ResponseModel : BaseModel

@property (nonatomic, assign) NSInteger resultcode;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) id result;

@end
