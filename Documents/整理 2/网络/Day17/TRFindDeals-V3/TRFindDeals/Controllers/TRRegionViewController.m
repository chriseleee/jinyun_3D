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

@interface TRRegionViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

//某个城市对应的所有区域数组
@property (nonatomic, strong) NSArray *regionArray;

@end

@implementation TRRegionViewController

- (NSArray *)regionArray {
    if (!_regionArray) {
#warning TODO: hard code
        _regionArray = [TRMetaDataTool regionsWithCityName:@"北京"];
    }
    return _regionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickChangeCity:(id)sender {
}

#pragma mark --- table view dataSoure/delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //判定tableview是左边还是右边
    if (tableView == self.mainTableView) {
        //左边表视图
        return self.regionArray.count;
    } else {
        //右边的表视图
        //获取用户左边选中的那一行
        NSInteger selectedRow = [self.mainTableView indexPathForSelectedRow].row;
        TRRegion *region = self.regionArray[selectedRow];
        return region.subregions.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.mainTableView) {
        //左边
        static NSString *identifier = @"leftCell";
        UITableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        
        //设定cell的背景图片
        UIImageView *bgView = [UIImageView new];
        bgView.image = [UIImage imageNamed:@"bg_dropdown_leftpart"];
        cell.backgroundView = bgView;
        
        UIImageView *selectedBgView = [UIImageView new];
        selectedBgView.image = [UIImage imageNamed:@"bg_dropdown_left_selected"];
        cell.selectedBackgroundView = selectedBgView;
        
        //设定cell的文本显示
        TRRegion *region = self.regionArray[indexPath.row];
        cell.textLabel.text = region.name;
        
        //设定cell右边图片
        if (region.subregions.count > 0) {
            //设定右箭头图片
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
        } else {
            cell.accessoryView = nil;
        }
        return cell;
    } else {
        //右边的表视图(取决于左边选中的哪行)
        
        //创建cell(重用机制)
        
        //设置cell的背景/文本 (获取左边选中是哪个)
        
    }
    
    return nil;
}









@end
