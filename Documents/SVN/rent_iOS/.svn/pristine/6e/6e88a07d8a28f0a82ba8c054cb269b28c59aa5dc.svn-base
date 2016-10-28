//
//  UIBarButtonItem+Extension.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "commentButton.h"
@implementation UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.mj_size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString*)title
{
//    commentButton *commentBtn = [[commentButton alloc]initWithFrame:CGRectMake(0, 0, AdjustW(42), AdjustW(20)) withImageName:image selectedImage:selectedImage];
//    commentBtn.titleLabel.text = title;
//    [commentBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [commentBtn makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.top).offset(AdjustW(12));
//        make.right.equalTo(_loveyBtn.left).offset(-AdjustW(30));
//        make.size.mas_equalTo(CGSizeMake(AdjustW(42), AdjustW(20)));
//    }];
 
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom]; //[[UIButton alloc]initWithFrame:CGRectZero withImageName:image selectedImage:selectedImage];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
//    // 设置尺寸
//    btn.mj_size = btn.currentBackgroundImage.size;
    //Label
    UILabel *titleL = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor color999999] fontSize:15 textAligment:NSTextAlignmentCenter];
    titleL.text = title;
    
    //将btn、label添加到view中
    UIView *itemView = [[UIView alloc]init];
    itemView.frame = CGRectMake(0, 0, AdjustW(50), AdjustW(24));
    [itemView addSubview:btn];
    [itemView addSubview:titleL];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(itemView).with.insets(UIEdgeInsetsMake(0, 0, 0,AdjustW(20)));

    }];
    [titleL makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(itemView).with.insets(UIEdgeInsetsMake(0, AdjustW(30), 0, 0));
    }];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemView];
        return item;
}


@end
