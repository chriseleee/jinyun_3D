//
//  TRImageTableViewController.m
//  Demo01-Review
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRImageTableViewController.h"
#import "TRDetailViewController.h"

@interface TRImageTableViewController ()

//存储所有图片的名字
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation TRImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数组
    self.imageArray = @[@"Flower鲜花", @"Peppers彩椒", @"Jellyfish水母", @"Sunset日路", @"Children孩子", @"SkateboardBoy滑板少年"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.imageArray[indexPath.row];
    
    return cell;
}

//点中cell触发方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.创建一个TRDetailViewController对象
    TRDetailViewController *detailViewController = [[TRDetailViewController alloc] init];
    
    //2.将下载的图片的地址url传过去
    NSString *imageStr = [NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_%ld.jpg", indexPath.row+1];
    NSURL *imageURL = [NSURL URLWithString:imageStr];
    detailViewController.imageURL = imageURL;
    
    //3.弹出控制器
    [self presentViewController:detailViewController animated:YES completion:nil];
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
