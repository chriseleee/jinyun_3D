//
//  TRChangeCityViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRChangeCityViewController.h"
#import "TRMetaDataTool.h"
#import "TRCityGroup.h"

@interface TRChangeCityViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *cityGroups;

@end

@implementation TRChangeCityViewController

- (NSArray *)cityGroups {
    if (!_cityGroups) {
        _cityGroups = [TRMetaDataTool cityGroups];
    }
    return _cityGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickCloseButton:(id)sender {
    //收回弹出的控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --- tableView DataSoure/Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //cityGroups数组 <---> section
    return self.cityGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TRCityGroup *cityGroup = self.cityGroups[section];
    return cityGroup.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //设定cell每行的文本(城市的名字)
    TRCityGroup *cityGroup = self.cityGroups[indexPath.section];
    NSString *cityName = cityGroup.cities[indexPath.row];
    cell.textLabel.text = cityName;
    
    return cell;
}

//table view右边的索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.cityGroups valueForKeyPath:@"title"];
}

//section header文本
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    TRCityGroup *cityGroup = self.cityGroups[section];
    return cityGroup.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.发送通知给TRRegionViewController,包含参数(用户选择的城市名字)
    TRCityGroup *cityGroup = self.cityGroups[indexPath.section];
    NSString *cityName = cityGroup.cities[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TRCityDidChange" object:nil userInfo:@{@"TRSelectedCityName":cityName}];
    
    //2.收回弹出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}








@end
