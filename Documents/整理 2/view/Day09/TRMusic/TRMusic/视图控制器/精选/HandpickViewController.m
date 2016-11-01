//
//  HandpickViewController.m
//  TRMusic
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "HandpickViewController.h"

@interface HandpickViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//UICollectionViewDelegateFlowLayout 这个代理负责定义cell的大小，边距，行间距等等
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong) UICollectionView *c1;
@property(nonatomic,strong) UICollectionView *c2;
@end
@implementation HandpickViewController
- (UICollectionView *)c1{
    if (!_c1) {
        _c1 = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _c1.delegate = self;
        _c1.dataSource = self;
        [_c1 registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
//添加头部视图
        [_c1 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    }
    return _c1;
}
- (UICollectionView *)c2{
    if (!_c2) {
        CGRect bounds = self.view.bounds;
        bounds.origin.x += bounds.size.width;
        _c2 = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _c2.delegate = self;
        _c2.dataSource = self;
        [_c2 registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [_c2 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    }
    return _c2;
}
//返回头部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    v.backgroundColor = [UIColor yellowColor];
    return v;
}
//返回头部视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (collectionView == _c1) {
        return CGSizeMake(self.view.bounds.size.width, 200);
    }else{
//   c2没有头部
        return CGSizeZero;
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self changeTabbarItemWithName:@"精选" imageName:@"tabbar_item_selected" selectedImageName:@"tabbar_item_selected_selected"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.c1];
    [self.scrollView addSubview:self.c2];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, 0);
}
//设置cell的边缘距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//上下左右 都是4像素距离距离屏幕边缘
    return UIEdgeInsetsMake(4, 4, 4, 4);
}
//设置cell 横排之间的最小距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 4;
}
//设置cell竖排之间的最小距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 4;
}
//设置cell的宽度和高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.bounds.size.width - 3*4) /2;
    return CGSizeMake(width, width);
}
//设置cell的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
//每个cell的样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    if (collectionView == _c1) {
        cell.backgroundColor = [UIColor redColor];
    }
    return cell;
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
