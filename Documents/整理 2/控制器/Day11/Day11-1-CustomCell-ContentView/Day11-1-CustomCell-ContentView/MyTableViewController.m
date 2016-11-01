//
//  MyTableViewController.m
//  Day11-1-CustomCell-ContentView
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (nonatomic, strong) NSArray *cityNames;
@end
@implementation MyTableViewController
- (NSArray *)cityNames{
    if (!_cityNames) {
        _cityNames = @[@"北京",@"上海",@"广州",@"杭州",@"大连",@"沈阳",@"哈尔滨",@"葫芦岛",@"深圳",@"南京",@"苏州",@"武汉",@"佛山",@"浙江",@"齐齐哈尔",@"乌鲁木齐",@"飞雪连天射白鹿",@"笑书神侠倚碧鸳"];
    }
    return _cityNames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
//看看cell中是否已经有了一个标签
//没有标签的话，新建一个标签，添加到contentView中
//有了标签，那么无需新建，只需要找到那个标签，改变标签上显示的文字即可
//先尝试着从contentView中，按照tag值取label
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    if (label == nil) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
        label.font = [UIFont systemFontOfSize:24];
        label.textColor = [UIColor redColor];
//设置阴影颜色
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(2, 2);
//设置标签的文本居中对齐
        label.textAlignment = NSTextAlignmentCenter;
//设置label的tag值
        label.tag = 100;
        [cell.contentView addSubview:label];
    }
    
    label.text = self.cityNames[indexPath.row];
//    cell.textLabel.text = @"TextLabel";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
