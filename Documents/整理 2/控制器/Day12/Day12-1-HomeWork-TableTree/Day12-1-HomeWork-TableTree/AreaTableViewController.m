//
//  AreaTableViewController.m
//  Day12-1-HomeWork-TableTree
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AreaTableViewController.h"

@interface AreaTableViewController ()

@end

@implementation AreaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _area.name;
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
    return _area.subAreas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
//根据Row来获取对应的数据项，进行展示
    Area *subArea = _area.subAreas[indexPath.row];
    cell.textLabel.text = subArea.name;
//如果包含子区域，显示箭头，否则不显示
    if (subArea.subAreas != nil) {
//非空，代表有子区域，显示箭头给用户看
        cell.accessoryType = 1;
    }else{
        cell.accessoryType = 0;
//如果没有子区域，在选中时不再出现灰色背景。
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
//点击某一行之后推出新的界面
//推出新的界面，样式与前一个界面是一样的，只是数据发生了变化
//选中一行，本质上我们选择是数据。 新建一个界面，把选中的数据传递过去。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//获取选中的Cell对应的Area实例
    Area *subArea = self.area.subAreas[indexPath.row];
//如果有子区域，就进行跳转操作
    if (subArea.subAreas != nil) {
//创建新的控制器实例
        AreaTableViewController *areaVC = [AreaTableViewController new];
//正向传递数据
        areaVC.area = subArea;
//推出新的控制器
        [self.navigationController pushViewController:areaVC animated:YES];
    }
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
