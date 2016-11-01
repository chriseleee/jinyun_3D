//
//  TRTableViewCell.m
//  TRFindDeals
//
//  Created by tarena on 15/9/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTableViewCell.h"

@implementation TRTableViewCell

+ (id)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName {
    
    static NSString *identifier = @"cell";
    TRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TRTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //cell背景图片
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:selectedImageName]];
    
    return cell;
}

//重写当前类的region set方法
//调用时机：cell.region = self.regionArray[0];
- (void)setRegion:(TRRegion *)region {
    //cell 文本
    self.textLabel.text = region.name;
    
    //cell右边的右箭头的图片
    if (region.subregions.count > 0) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
    } else {
        self.accessoryView = nil;
    }
}

//重写当前类的category set方法
- (void)setCategory:(TRCategory *)category {
    //text
    self.textLabel.text = category.name;
    
    //imageView图片/高亮图片
    self.imageView.image = [UIImage imageNamed:category.small_icon];
    self.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
    
    //右边的右箭头图片
    if (category.subcategories.count > 0) {
        //有子区域
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
    } else {
        self.accessoryView = nil;
    }
}





@end
