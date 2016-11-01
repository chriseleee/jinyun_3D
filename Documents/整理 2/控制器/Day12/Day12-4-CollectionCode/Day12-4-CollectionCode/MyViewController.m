//
//  MyViewController.m
//  Day12-4-CollectionCode
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"
#import "MyCollectionViewCell.h"

@interface MyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//负责定义视图中 cell的大小，行和列的最小间距，滚动方向，内容与4个边缘的位置关系 等等属性。
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
//    Cell的大小
    layout.itemSize = CGSizeMake(80, 80);
//    最小列间距
    layout.minimumInteritemSpacing = 10;
//    最小行间距
    layout.minimumLineSpacing = 10;
//    滚动方向为横向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    内容距离屏幕边缘的距离
//参数顺序是top,left,bottom,right
    layout.sectionInset = UIEdgeInsetsMake(154, 30, 154, 30);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
//必须通过注册class方式 实现重用
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MyCell"];
//一个表格视图可以注册不同的cell类型，只需要唯一标识不同就可以了。
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"Cell1"];
    
    
//翻动效果与翻页一样
    collectionView.pagingEnabled = YES;
}

#pragma mark - UICollcectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//Cell的行数是偶数时，显示带图片的 Cell1
//奇数时显示红底的  MyCell
    if (indexPath.row%2 == 1) { //奇数
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    }else{
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
        cell.backGroundIV.image = [UIImage imageNamed:@"icon180"];
        return cell;
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
