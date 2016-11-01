//
//  NewsTableViewController.m
//  Day11-3-News
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsCell.h"
#import "News.h"

@interface NewsTableViewController ()
@property(nonatomic,strong) NSArray *allNews;
@end
@implementation NewsTableViewController
- (NSArray *)allNews{
    if (!_allNews) {
        _allNews = [News demoData];
    }
    return _allNews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//配置表头视图
    UIImageView *headerIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
//x,y无效
     headerIV.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 210);
    self.tableView.tableHeaderView = headerIV;

//注册Cell
//因为自定义的单元格带有xib文件，所以选择registerNib
    UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MyCell"];
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
    return self.allNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
//如果使用重用方式一，也就是不提前注册
//则在创建Cell实例时，需要制定加载哪个xib文件
//    if (cell == nil) {
//        cell = (NewsCell *)[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil].firstObject;
//        
//    }
    
//    获取对应行 的 数据
    News *n = self.allNews[indexPath.row];
//将新闻的各个属性显示在Cell的控件中
    cell.titleLb.text = n.title;
    cell.commentLb.text = n.commentNum;
    cell.newsIV.image = [UIImage imageNamed:n.imageName];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//默认是44高    
    return 83;
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
