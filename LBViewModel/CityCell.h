//
//  CityCell.h
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CityModel;
@interface CityCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *provinceLabel;
@property (strong, nonatomic) IBOutlet UILabel *districtLabel;

- (void)setValueWithViewModel:(CityModel *)model;

@end
