//
//  CollectionViewController.m
//  Demo2_CollectionView_Custom_Layout
//
//  Created by xiaoz on 15/1/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CollectionViewController.h"
#import "Cell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.bgImageView.image = [UIImage imageNamed:@"dykenpond.png"];
    return cell;
}


@end





