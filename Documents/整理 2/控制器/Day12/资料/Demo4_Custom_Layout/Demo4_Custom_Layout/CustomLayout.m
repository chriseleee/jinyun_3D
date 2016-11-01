//
//  CustomLayout.m
//  Demo4_Custom_Layout
//
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CustomLayout.h"

@implementation CustomLayout



//内容区域总大小，不是可见区域
- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.bounds.size.width,[self.collectionView numberOfItemsInSection:0]*200/3+200);
}

//所有单元格位置信息
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *array = [NSMutableArray array];
    CGFloat cellCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i<cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attribute];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //CGFloat itemSpacing = 2;
    CGFloat lineSpacing = 5;
    CGFloat largeCellSider = 200.0;
    CGFloat smallCellSider = 100.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 5, 2, 5);
    
    //当前行数，每行显示3个图片，1大2小
    NSInteger line = indexPath.item / 3;
    
    //当前航的Y坐标
    CGFloat lineOriginY = largeCellSider*(CGFloat)line+lineSpacing*line+insets.top;
    //右侧单元格x坐标
    CGFloat rightLargeX = self.collectionView.bounds.size.width - largeCellSider  - insets.right;
    CGFloat rightSmallX = self.collectionView.bounds.size.width - smallCellSider - insets.right;
    //每行2个图片，2行循环一次，一共6种位置
    if (indexPath.item % 6 ==0) {
        attribute.frame = CGRectMake(insets.left, lineOriginY, largeCellSider, largeCellSider);
    }else if(indexPath.item % 6 == 1){
        attribute.frame = CGRectMake(rightSmallX, lineOriginY, smallCellSider, smallCellSider);
    }else if(indexPath.item % 6 == 2){
        attribute.frame = CGRectMake(rightSmallX, lineOriginY+smallCellSider+insets.top , smallCellSider, smallCellSider);
    }else if(indexPath.item % 6 == 3){
        attribute.frame = CGRectMake(insets.left, lineOriginY, smallCellSider, smallCellSider);
    }else if(indexPath.item % 6 == 4){
        attribute.frame = CGRectMake(insets.left, lineOriginY+smallCellSider+insets.top, smallCellSider, smallCellSider);
    }else if(indexPath.item % 6 == 5){
        attribute.frame = CGRectMake(rightLargeX, lineOriginY, largeCellSider, largeCellSider);
    }
    return attribute;
}
@end
