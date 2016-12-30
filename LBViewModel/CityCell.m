//
//  CityCell.m
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "CityCell.h"
#import "CityViewModel.h"

@implementation CityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setValueWithViewModel:(CityModel *)model {
    self.cityLabel.text = [NSString stringWithFormat:@"city: %@", model.city];
    self.provinceLabel.text = [NSString stringWithFormat:@"province: %@", model.province];
    self.districtLabel.text = [NSString stringWithFormat:@"city: %@", model.district];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
