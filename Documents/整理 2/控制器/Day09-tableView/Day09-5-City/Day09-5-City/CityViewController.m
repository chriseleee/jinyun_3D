//
//  CityViewController.m
//  Day09-5-City
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityViewController.h"
#import "AreaViewController.h"
#import "City.h"

@interface CityViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *citys;
@end
@implementation CityViewController
- (NSArray *)citys{
    if (!_citys) {
        _citys = [City cityArr];
    }
    return _citys;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"城市";
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.citys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
        cell.accessoryType = 1;
    }
    City *city = self.citys[indexPath.row];
    cell.textLabel.text = city.cityName;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AreaViewController *areaVC = [AreaViewController new];
    City *city = self.citys[indexPath.row];
    areaVC.areas = city.areas;
    [self.navigationController pushViewController:areaVC animated:YES];
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
