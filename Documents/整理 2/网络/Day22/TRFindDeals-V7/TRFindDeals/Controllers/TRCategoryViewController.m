//
//  TRCategoryViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCategoryViewController.h"
#import "TRTableViewCell.h"
#import "TRMetaDataTool.h"
#import "TRCategory.h"

@interface TRCategoryViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

//存储所有分类的数据
@property (nonatomic, strong) NSArray *categoryArray;
@end

@implementation TRCategoryViewController

- (NSArray *)categoryArray {
    if (!_categoryArray) {
        _categoryArray = [TRMetaDataTool categories];
    }
    return _categoryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark --- tableView DataSourc/Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.mainTableView) {
        //主分类的个数
        return self.categoryArray.count;
    } else {
        //左边选择的是哪个分类
        NSInteger selectedRow = [self.mainTableView indexPathForSelectedRow].row;
        TRCategory *category = self.categoryArray[selectedRow];
        return category.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        //左边cell设置
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        //设置cell的属性(imageView/text/accessoryView)
        cell.category = self.categoryArray[indexPath.row];
        return cell;
        
    } else {
        //右边cell设置
        TRTableViewCell *cell = [TRTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        NSInteger selectedRow = [self.mainTableView indexPathForSelectedRow].row;
        TRCategory *category = self.categoryArray[selectedRow];
        cell.textLabel.text = category.subcategories[indexPath.row];
        
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.mainTableView) {
        [self.secondTableView reloadData];
        //情况一：没有子分类(院线影院)
        TRCategory *category = self.categoryArray[indexPath.row];
        if (category.subcategories.count == 0) {
            //发送通知给主视图控制器
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TRCategoryDidChange" object:nil userInfo:@{@"TRSelectedCategory":category}];
        }
    } else {
        //情况二：有子分类
        //选中左边和右边的行号
        NSInteger leftRow = [self.mainTableView indexPathForSelectedRow].row;
        NSInteger rightRow = [self.secondTableView indexPathForSelectedRow].row;
        TRCategory *category = self.categoryArray[leftRow];
        NSString *subCategoryStr = category.subcategories[rightRow];
        //往主视图控制器发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TRCategoryDidChange" object:nil userInfo:@{@"TRSelectedCategory":category,@"TRSelectedSubCategoryStr":subCategoryStr}];
    }
}









@end
