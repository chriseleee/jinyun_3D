//
//  SelectionView.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "SelectionView.h"
#import "CGUpDownButton.h"
#import "HWDropdownMenu.h"
#import "CGPickViewController.h"
#import "HomePageCellModel.h"
@interface SelectionView ()<HWDropdownMenuDelegate>

@end

@implementation SelectionView
#pragma mark 懒加载
-(NSDictionary *)parametDic{
    if (!_parametDic) {
        _parametDic = [NSDictionary dictionary];
    }
    return _parametDic;
}


#pragma mark UI
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGLog(@"SelectionView-%@",self);
    
    self.selectionArray = @[@"默认",@"品牌/型号",@"刷新率"];
    
    for (int i = 0; i<self.selectionArray.count ; i++) {
        
        CGUpDownButton *selectionBtn = [[CGUpDownButton alloc]initWithFrame:CGRectZero withImageName:@"arrow_down_dark" selectedImage:@"arrow_up_dark"];
        CGFloat btnWidth = self.mj_w/self.selectionArray.count;
        selectionBtn.tag = i;
        [self addSubview:selectionBtn];
        WS(ws);
        [selectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.left).with.offset(btnWidth*i);
            make.top.equalTo(ws.top);
            make.bottom.equalTo(ws.bottom);
            make.width.equalTo(@(btnWidth));
        }];
        [selectionBtn setTitle:self.selectionArray[i] forState:UIControlStateNormal];
        [selectionBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

#pragma mark 筛选按钮点击事件
-(void)titleClick:(UIButton *)titleButton{
    
    //
//    titleButton.selected = !titleButton.selected;
    
    // 1.创建下拉菜单
    HWDropdownMenu *menu = [HWDropdownMenu menu];
    menu.delegate = self;
    self.dropDownMenu = menu;
    // 2.设置内容
    CGPickViewController *vc = [[CGPickViewController alloc] init];
    vc.parametDic =[NSMutableDictionary dictionaryWithDictionary:self.parametDic];
    vc.currentBtnTag = titleButton.tag;
    vc.fatherView = self;
    if (titleButton.tag == 0) {
        vc.tableViewNumber = 1;
        vc.categoryArray = @[@"最新",@"人气",@"价格↑",@"价格↓"];

    }else if (titleButton.tag == 1){
        
        
        //获取品牌／型号列表
        [self getBrand:vc];
        
        vc.tableViewNumber = 2;
//        vc.categoryArray = @[@"TCL",@"iPhone",@"小米",@"三星"];
//        vc.secondArray = @[@[@"TCL-1",@"TCL-2",@"TCL-3"],@[@"iPhone6",@"iPhone6p",@"iPhone6s",@"iPhone6sp"],@[@"小米1",@"小米2",@"小米3",@"小米4"],@[@"三星-盖世1",@"三星-盖世2"]];
    }else if(titleButton.tag == 2){
        vc.tableViewNumber = 1;
        vc.categoryArray = @[@"0~25",@"25~60",@"60~100"];
    }
    vc.view.mj_h = AdjustW(150);
    vc.view.mj_w = SCREEN_WIDTH;
    menu.contentController = vc;
    
    // 3.显示
    [menu showFrom:titleButton];
}

-(void)getBrand:(CGPickViewController*)vc{
    NSDictionary *parm = nil;
    [CGTool showHUDProgress:@"加载中"];
    [[NetKit kit]GETWithURLString:@"api/rent/brands" parameters:parm success:^(id ret) {
        //数据处理
        
        NSArray *newData = [HomePageCellModel objectArrayWithKeyValuesArray:ret[@"body"]];
        NSMutableArray *mutArr = [NSMutableArray array];
        NSMutableArray *lastArr =[NSMutableArray array];
        NSMutableArray *nameArray =[NSMutableArray array];
        //保存name对应的ID
        NSMutableArray *nameArrayID =[NSMutableArray array];
        for (int i = 0; i<newData.count; i++) {
            HomePageCellModel *dic = newData[i];
            if (dic.type==0) {
                [mutArr addObject:newData[i]];
                HomePageCellModel *dic1 = newData[i];
                [nameArray addObject:dic1.name];
                [nameArrayID addObject:dic1.id];
                
            }else{
                [lastArr addObject:newData[i]];
            }
        }
        vc.categoryArray = nameArray;
        vc.categoryIDArray = nameArrayID;
        vc.secondArray = [NSMutableArray array];
        vc.secondIDArray = [NSMutableArray array];
        for (int i = 0; i<mutArr.count; i++) {
            NSMutableArray *arr = [NSMutableArray array];
            NSMutableArray *arrParent = [NSMutableArray array];
            HomePageCellModel *dic1 = mutArr[i];
            for (int j = 0; j<lastArr.count; j++) {
                HomePageCellModel *dic2 = [[HomePageCellModel alloc]init];
                dic2=lastArr[j];
                if([dic1.id isEqualToString:dic2.parentId]){
                    CGLog(@"dic1.id=%@,parentId=%@",dic1.id ,dic2.parentId);
                    NSString *name =dic2.name;
                    [arr addObject:name];
                    [arrParent addObject:dic2.id];
                }
                
                
            }
            
            [vc.secondArray insertObject:arr atIndex:i];
            [vc.secondIDArray insertObject:arrParent atIndex:i];
        }
        CGLog(@"%@----%@",vc.categoryArray,vc.secondArray);
        [vc.MainTableView reloadData];
        [vc.SecondTableView reloadData];
        [CGTool removeHUDProgress];
    } error:^(NSInteger code, NSString *msg, id ret) {
        [CGTool removeHUDProgress];
    } failure:^(NSError *error) {
        [CGTool removeHUDProgress];
    }];
}

@end
