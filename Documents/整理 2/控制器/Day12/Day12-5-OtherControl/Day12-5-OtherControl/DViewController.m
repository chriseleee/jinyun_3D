//
//  DViewController.m
//  Day12-5-OtherControl
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property(nonatomic, strong) NSDictionary *citys;
//第一列数据
@property (nonatomic, strong) NSArray *firstArr;
//第二列数据
@property (nonatomic, strong) NSArray *secondArr;
@end
@implementation DViewController
- (NSDictionary *)citys{
    if (!_citys) {
        _citys = @{
                   @"北京":@[@"东城", @"西城"],
                   @"上海":@[@"徐汇", @"静安"],
                   @"广州":@[@"白云", @"天河"],
                   };
    }
    return _citys;
}
- (NSArray *)firstArr{
    if (!_firstArr) {
//提取所有key值作为第一列的数据
        _firstArr = [self.citys allKeys];
    }
    return _firstArr;
}
- (NSArray *)secondArr{
    if (!_secondArr) {
//根据第一个城市名称，获取对应的数组，作为首次加载时，第二列的数据源
        _secondArr = [self.citys valueForKey:self.firstArr.firstObject];
    }
    return _secondArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - UIPickerViewDataSource
//问题1:有多少竖排，列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//问题2:每个竖排中有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.firstArr.count;
    }else{
        return self.secondArr.count;
    }
}
//问题3:某列某行显示的文字是什么？
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.firstArr[row];
    }else{
        return self.secondArr[row];
    }
}
//当移动第一排数据，第二排要随之变化
//下面方法就是 当选择某一行时，触发的
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
//获取第一列中选中的值
        NSString *selectedCityName = self.firstArr[row];
//根据第一列的城市名找到对应的value，更新第二列数组
        self.secondArr = [self.citys valueForKey:selectedCityName];
//刷新picker
        [pickerView reloadComponent:1];
//修改第二列中第一行成为选中的值
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
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
