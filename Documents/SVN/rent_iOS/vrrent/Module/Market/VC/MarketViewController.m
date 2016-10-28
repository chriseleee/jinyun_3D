//
//  MarketViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketViewCell.h"
#import "MarketCellModel.h"
#import "MarketDetailVC.h"
@interface MarketViewController ()
/**
 *  参数字典
 */
@property (strong,nonatomic)NSDictionary* parametDic;
/**
 *  minId
 */
@property (strong,nonatomic)NSString* minId;
/**
 *  数据数组
 */
@property (strong,nonatomic)NSMutableArray* dataArray;
@end

@implementation MarketViewController

static NSString * const reuseIdentifier = @"Cell";

-(NSDictionary *)parametDic{
    if (!_parametDic) {
        _parametDic = [NSDictionary dictionary];
    }
    return _parametDic;
}
-(NSString *)minId{
    if (!_minId) {
        _minId = @"0";
    }
    return _minId;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //负责定义视图中 cell的大小，行和列的最小间距，滚动方向，内容与4个边缘的位置关系 等等属性。
    
    
    // Register cell classes
    [self.collectionView registerClass:[MarketViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //导入数据
    [self headerRereshing];

}

//下拉刷新
- (void)headerRereshing
{
    //一般这些个里边是网络请求，然后会有延迟，不会像现在刷新这么快
    // 1.刷新动作
    [self updateData];
    
}

/**
 *  更新数据.
 *
 *  数据更新后,会自动更新视图.
 */
- (void)updateData{
    
    self.parametDic = @{
                        @"minId":[NSString stringWithFormat:@"%@",self.minId],
                        @"pageSize":@"20",
                        };
    
    [self NetToLoadData:self.parametDic];
}

-(void)NetToLoadData:(NSDictionary*)paramentDic
{
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:paramentDic];
    
    [[NetKit kit]GETWithURLString:@"api/product/findProducts" parameters:dic success:^(id ret) {
        
        NSArray *newData = [MarketCellModel objectArrayWithKeyValuesArray:ret[@"body"]];
        self.dataArray = [NSMutableArray arrayWithArray:newData];
        [self.collectionView reloadData];
        
        //2.结束刷新
        [self endRefresh];
        
    } error:^(NSInteger code, NSString *msg, id ret) {
        
        //2.结束刷新
        [self endRefresh];
    } failure:^(NSError *error) {
        
        //2.结束刷新
        [self endRefresh];
    }];
    
}

/**
 *  停止刷新
 */
-(void)endRefresh{
    [self.collectionView.header endRefreshing];
    [self.collectionView.footer endRefreshing];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //回答有多少个分组
    return 1;
}
//回答分组中有多少个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MarketViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //集合视图 是高度自定义的视图。 每个cell中不带有任何自带的控件，只有一个contentView。
    cell.contentDic = self.dataArray[indexPath.row];
//    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
//    if (label == nil) {
//        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
//        label.tag = 100;
//        label.textAlignment = NSTextAlignmentCenter;
//        [cell.contentView addSubview:label];
//    }
//    //把row(double类型)转换为number类型，然后调用number类型的stringValue方法，转为字符串。  希望能掌握。
//    label.text = @(indexPath.row).stringValue;
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MarketDetailVC *vc = [[MarketDetailVC alloc]init];
    MarketCellModel *model = self.dataArray[indexPath.row];
    vc.productId = model.id;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
