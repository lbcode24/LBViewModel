//
//  CityViewModel.h
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "LBViewModel.h"

@interface CityViewModel : LBViewModel

//获取城市列表数据
- (void)getCityList;

@end

@interface CityModel : BaseModel

//{
//    "id": "1",
//    "province": "北京",
//    "city": "北京",
//    "district": "北京"
//}

@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *district;

@end
