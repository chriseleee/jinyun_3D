//
//  TRRegionViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRRegionViewController.h"
#import "TRMetaDataTool.h"
#import "TRRegion.h"
#import "TRTableViewCell.h"
#import "TRChangeCityViewController.h"

@interface TRRegionViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

//某个城市对应的所有区域数组
@property (nonatomic, strong) NSArray *regionArray;

@end

@implementation TRRegionViewController

//- (NSArray *)regionArray {
//    if (!_regionArray) {
//#warning TODO: hard code
//        _regionArray = [TRMetaDataTool regionsWithCityName:@"北京"];
//    }
//    return _regionArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听城市视图控制器发送的通知(用户选择的城市名字)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityDidChange:) name:@"TRCityDidChange" object:nil];
}

- (void)cityDidChange:(NSNotification *)notification {
    NSString *cityName = notification.userInfo[@"TRSelectedCityName"];
    self.regionArray = [TRMetaDataTool regionsWithCityName:cityName];
    
    [self.mainTableView reloadData];
    [self.secondTableView reloadData];
    
}

- (IBAction)clickChangeCity:(id)sender {
    //1.创建弹出控制器对象
    TRChangeCityViewController *changeViewController = [TRChangeCityViewController new];
    changeViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    //2.执行弹出的动作
    [self presentViewController:changeViewController animated:YES completion:nil];
}

#pragma mark --- table view dataSoure/delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //判定tableview是左边还是右边
    if (tableView == self.mainTableView) {
        //左边表视图
        return self.regionArray.count;
    } else {
        //首先判定区域数组是否为空
        if (self.regionArray.count > 0) {
            //右边的表视图
            //获取用户左边选中的那一行
            NSInteger selectedRow = [self.mainTableView indexPathForSelectedRow].row;
            TRRegion *region = self.regionArray[selectedRow];
            return region.subregions.count;
        } else {
            //没有任何区域的数据
            return 0;
        }

    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.mainTableView) {
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        if (self.regionArray.count > 0) {
            //设定cell的各种属性
            cell.region = self.regionArray[indexPath.row];
            return cell;
        } else {
            return nil;
        }
        
    } else {
        //创建cell(重用机制)
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        
        //右边的表视图(取决于左边选中的哪行)
        NSInteger selectedRow = [self.mainTableView indexPathForSelectedRow].row;
        
        if (self.regionArray.count > 0) {
            //设置cell的文本 (获取左边选中是哪个)
            TRRegion *region = self.regionArray[selectedRow];
            cell.textLabel.text = region.subregions[indexPath.row];
            return cell;
        } else {
            return nil;
        }
    }
}
//点中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        //刷新右边的表视图
        [self.secondTableView reloadData];
        
        //情况一：没有子区域(发送通知)
        //获取用户选择的左边那行对应的区域模型对象
        TRRegion *region = self.regionArray[indexPath.row];
        if (region.subregions.count == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TRRegionDidChange" object:nil userInfo:@{@"TRSelectedRegion":region}];
        }

        
    } else {
        //情况二：点中右边表视图 (表明有子区域) -> 发送通知
        //获取用户点中的左边和右边的行号
        NSInteger leftRow = [self.mainTableView indexPathForSelectedRow].row;
        NSInteger rightRow = [self.secondTableView indexPathForSelectedRow].row;
        TRRegion *region = self.regionArray[leftRow];
        NSString *subRegionName = region.subregions[rightRow];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TRRegionDidChange" object:nil userInfo:@{@"TRSelectedRegion":region, @"TRSelectedSubRegionName":subRegionName}];
    }
}









@end
