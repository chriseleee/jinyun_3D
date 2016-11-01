//
//  LineLayout.m
//  Demo2_CollectionView_Custom_Layout
//
//  Created by xiaoz on 15/1/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "LineLayout.h"

#define ITEM_SIZE 200.0

@implementation LineLayout

#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.5

-(instancetype)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(184, 0.0, 184, 0.0);
        self.minimumLineSpacing = 50.0;
    }
    return self;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

// 实现每一个item的zoom，在中心点的就方法，不在中心点的就恢复到原始大小
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //1.获取可见区域的大小
    CGRect visiableRect;
    visiableRect.origin = self.collectionView.contentOffset;
    visiableRect.size = self.collectionView.bounds.size;
    //获取可见区域的中心点
    CGFloat visiableRectCenterX = CGRectGetMidX(visiableRect);
    //2.遍历区域内的每一个元素的尺寸
    for (UICollectionViewLayoutAttributes *attributes in array) {
        //获取遍历的元素的中心店与可见区域的中心点的间距
        CGFloat distance = visiableRectCenterX - attributes.center.x;
        CGFloat nomalizedDistance = distance / ACTIVE_DISTANCE;
        if (ABS(distance)<ACTIVE_DISTANCE) {
            CGFloat zoom = 1+ZOOM_FACTOR*(1-ABS(nomalizedDistance));
            attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1);
            attributes.zIndex = 1;
        }
    }
    return array;
}
//-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;
//    
//    for (UICollectionViewLayoutAttributes *attributes in array){
//        //if (CGRectIntersectsRect(attributes.frame, rect)) {
//            CGFloat distance = CGRectGetMidX(visibleRect)-attributes.center.x;
//            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
//            if (ABS(distance) < ACTIVE_DISTANCE) {
//                CGFloat zoom = 1+ZOOM_FACTOR*(1-ABS(normalizedDistance));
//                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
//                attributes.zIndex  = 1;
//            }
//        //}
//    }
//    return array;
//}

//将离中心点最近的item置于屏幕的中间点
//-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
//    CGFloat offsetAdjustment = MAXFLOAT;
//    CGFloat horizontalCenter = proposedContentOffset.x+(CGRectGetWidth(self.collectionView.bounds)/2.0);
//    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
//    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
//    for (UICollectionViewLayoutAttributes *layoutAttributes in array){
//        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
//        if (ABS(itemHorizontalCenter - horizontalCenter)<abs(offsetAdjustment)) {
//            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
//        }
//    }
//    return CGPointMake(proposedContentOffset.x+offsetAdjustment,proposedContentOffset.y);
//}

@end






















