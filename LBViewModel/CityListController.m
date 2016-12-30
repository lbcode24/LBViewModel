//
//  CityListController.m
//  LBViewModel
//
//  Created by LiuBang on 2016/12/30.
//  Copyright © 2016年 lbcode24. All rights reserved.
//

#import "CityListController.h"
#import "CityCell.h"
#import "CityViewModel.h"

@interface CityListController ()<UITableViewDelegate, UITableViewDataSource, LBViewModelDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CityListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //找的免费接口，数据量非常大，访问速度不佳，只做测试用
    CityViewModel *viewModel = [[CityViewModel alloc] init];
    [viewModel setDelegate:self];
    [viewModel getCityList];
}

#pragma mark - LBViewModel's delegate method
- (void)correctRequestDataWithViewModel:(id)data resultCode:(NSInteger)resultCode {
    self.dataArray = [data copy];
    [_tableView reloadData];
}

#pragma mark - UITableView's delegate/dataSouce method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray.count > 0) {
        return 20;
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CityListId";
    CityCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CityCell" owner:self options:nil] lastObject];
    }
    [cell setValueWithViewModel:self.dataArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
