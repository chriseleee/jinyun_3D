//
//  CGPickViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "CGPickViewController.h"
#import "SelectionView.h"
@interface CGPickViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CGPickViewController

#pragma mark 懒加载
-(UITableView *)MainTableView{
    if (!_MainTableView) {
        _MainTableView = [[UITableView alloc]init];
    }
    return _MainTableView;
}

-(UITableView *)SecondTableView{
    if (!_SecondTableView) {
        _SecondTableView = [[UITableView alloc]init];
    }
    return _SecondTableView;
}
- (NSArray *)categoryArray {
    if (!_categoryArray) {
        _categoryArray = [NSArray array];
    }
    return _categoryArray;
}
- (NSArray *)categoryIDArray {
    if (!_categoryIDArray) {
        _categoryIDArray = [NSArray array];
    }
    return _categoryIDArray;
}

//-(NSMutableArray *)secondArray{
//    if (!_secondArray) {
//        _secondArray = [NSMutableArray array];
//    }
//    return _secondArray;
//}
//-(NSMutableDictionary *)parametDic{
//    if (!_parametDic) {
//        _parametDic = [NSMutableDictionary dictionary];
//    }
//    return _parametDic;
//}

#pragma mark UI
-(void)viewDidLoad{
    
    [self.view addSubview:self.MainTableView];
    self.MainTableView.delegate =self;
    self.MainTableView.dataSource = self;
    WS(ws)
    if (self.tableViewNumber == 1) {
        [_MainTableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view);
        }];
    }else if (self.tableViewNumber == 2){
        [_MainTableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view).insets(UIEdgeInsetsMake(0, 0, 0, ws.view.mj_w/2));
        }];
        
        [self.view addSubview:self.SecondTableView];
        self.SecondTableView.delegate =self;
        self.SecondTableView.dataSource = self;
        
        [_SecondTableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view).insets(UIEdgeInsetsMake(0, ws.view.mj_w/2, 0, 0));
        }];
    }
}

#pragma mark --- tableView DataSourc/Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.tableViewNumber == 1) {
        return self.categoryArray.count;
    }else if (self.tableViewNumber == 2) {
        if (tableView == self.MainTableView) {
            //主分类的个数
            return self.categoryArray.count;
        }else{
            //左边选择的是哪个分类
            NSInteger selectedRow = [self.MainTableView indexPathForSelectedRow].row;
            
            NSArray* category = self.secondArray[selectedRow];
            return category.count+1;
        }
    }else{
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.MainTableView) {
        //左边cell设置
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:1 reuseIdentifier:@"Main"];
        //设置cell的属性(imageView/text/accessoryView)
        cell.textLabel.text = self.categoryArray[indexPath.row];
        return cell;
        
    } else {
        //右边cell设置
        //左边cell设置
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:1 reuseIdentifier:@"Second"];
        NSInteger selectedRow = [self.MainTableView indexPathForSelectedRow].row;
        NSArray *category = self.secondArray[selectedRow];
        //设置cell的属性(imageView/text/accessoryView)
        if (indexPath.row==0) {
            cell.textLabel.text = @"全部";
        }else{
            cell.textLabel.text = category[indexPath.row-1];
        }
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.tableViewNumber == 2) {
        if (tableView == self.SecondTableView) {
            NSInteger selectedRow = [self.MainTableView indexPathForSelectedRow].row;
            [self.parametDic setValue:self.categoryIDArray[selectedRow] forKey:@"brandsId"];
            NSArray *arr = self.secondIDArray[selectedRow];

            if (indexPath.row!=0) {
                [self.parametDic setValue:arr[indexPath.row-1] forKey:@"version"];
            }

            /**
             *  跳转界面
             */
            [self.parametDic setValue:@"" forKey:@"pvid"];
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.parametDic];
            [HWNotificationCenter postNotificationName:CGHomePagePostParmentNotification object:nil userInfo:dic];
            
            [self.fatherView.dropDownMenu dismiss];
        }else{
            [self.SecondTableView reloadData];
        }
    }else{
        if (self.currentBtnTag==0) {
            [self.parametDic setValue:@(indexPath.row+1) forKey:@"orderBy"];
        }else if (self.currentBtnTag == 2){
            NSString *rateString =[NSString stringWithFormat:@"%@",self.categoryArray[indexPath.row]];
            NSRange range = [rateString rangeOfString:@"~"];//匹配得到的下标
            NSString *min = [rateString substringToIndex:range.location];//截取范围类的字符串
            NSString *max = [rateString substringFromIndex:range.location+1];
            CGLog(@"min=%@,max=%@",min,max);
            [self.parametDic setValue:min forKey:@"minRate"];
            [self.parametDic setValue:max forKey:@"maxRate"];
        }
        /**
         *  跳转界面
         */
        [self.parametDic setValue:@"" forKey:@"pvid"];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.parametDic];
        [HWNotificationCenter postNotificationName:CGHomePagePostParmentNotification object:nil userInfo:dic];
        
        [self.fatherView.dropDownMenu dismiss];

    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}




@end
