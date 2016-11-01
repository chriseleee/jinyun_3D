//
//  CityViewController.m
//  Day09-6-Sections
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CityViewController.h"
#import "City.h"

@interface CityViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *cityArr;
@end
@implementation CityViewController

- (NSArray *)cityArr{
    if (!_cityArr) {
        _cityArr = [City cityArr];
    }
    return _cityArr;
}
#pragma mark - UITableViewDataSource
//有多少个城市就有多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityArr.count;
}
//不同的分区 有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//1.根据分区号得到 该分区对应的城市对象
    City *city = self.cityArr[section];
//2.city对象中的子地区个数就是cell的个数
    return city.areas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell "];
    }
//1.根据分区号获得对应的城市对象
    City *city = self.cityArr[indexPath.section];
//2.从城市对象中取得区域数组，根据行数作为下标，取得每行要显示的文字
    cell.textLabel.text = city.areas[indexPath.row];
//    cell.userInteractionEnabled=NO;
    return cell;
}
//设置每个分区的头部题目
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    City *city = self.cityArr[section];
    return city.cityName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
