//
//  CityListViewModel.m
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "CityViewModel.h"
#import "HttpRequestTool.h"

@implementation CityViewModel

- (void)getCityList {
    NSMutableDictionary *params = [HttpRequestTool creatRequestDic];
    [params setValue:@"json" forKey:@"dtype"];
    [HttpRequestTool postRequestWithUrl:@"/weather/citys" params:params success:^(id json) {
        ResponseModel *response = [[ResponseModel alloc] initWithDic:json];
        if (response.resultcode == 200) {
            NSMutableArray *dataArray = [NSMutableArray array];
            for (NSDictionary *dic in response.result) {
                CityModel *model = [[CityModel alloc] initWithDic:dic];
                [dataArray addObject:model];
            }
            if ([self.delegate respondsToSelector:@selector(correctRequestDataWithViewModel:resultCode:)]) {
                [self.delegate correctRequestDataWithViewModel:dataArray resultCode:200];
            }
        }
        
    } failed:^(id json) {
        if ([self.delegate respondsToSelector:@selector(faildRequestWithError:)]) {
            [self.delegate faildRequestWithError:json];
        }
    }];
}

@end

@implementation CityModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super initWithDic:dic];
    if (self) {
        self.cityId = dic[@"id"];
    }
    return self;
}

@end
