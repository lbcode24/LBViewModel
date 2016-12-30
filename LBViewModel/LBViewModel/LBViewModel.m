//
//  LBViewModel.m
//  LBViewModel
//
//  Created by LiuBang on 2016/12/27.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "LBViewModel.h"

@implementation LBViewModel

@end

@implementation BaseModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setModelValueByDic:dic];
    }
    return self;
}

/*
 *  遍历传过来的字典，将里面的值按照model对应的set方法进行设置
 */
- (void)setModelValueByDic:(NSDictionary *)dic {
    //如果传过来的字典类型不对，就直接返回一个空的viewmodel，防止crash
    if ([dic isKindOfClass:[NSNull class]] || dic == nil || dic == NULL) {
        return;
    }
    
    for (NSString *key in dic.allKeys) {
        SEL settingMethod = [self getSettingMethodWithKey:key];
        if ([self respondsToSelector: settingMethod]) {
            id object = [dic objectForKey:key];
            if (object != NULL || object != nil || object != [NSNull null]) {
                if ([self respondsToSelector:settingMethod]) {
                    if ([object respondsToSelector:@selector(stringValue)]) {
                        NSString *str = [object stringValue];
                        [self performSelector:settingMethod withObject:str];
                    }else{
                        [self performSelector:settingMethod withObject:object];
                    }
                }
            }
        }
    }
}

/*
 *  通过key来获取set方法
 */
- (SEL)getSettingMethodWithKey:(NSString *)keyString {
    NSString *firstString = [[keyString substringToIndex:1] uppercaseString];
    keyString = [keyString stringByReplacingCharactersInRange:NSMakeRange(0, 1)withString:firstString];
    NSString *method = [NSString stringWithFormat:@"set%@:", keyString];
    return NSSelectorFromString(method);
}


@end

@implementation ResponseModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super initWithDic:dic];
    if (self) {
        self.resultcode = [dic[@"resultcode"] integerValue];
    }
    return self;
}

@end

