//
//  ViewController.m
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "Poker.h"
#import "Card.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLb;
//增加游戏，需要扑克
@property (nonatomic, strong) Game *game;
@property (nonatomic, strong) Poker *poker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//等同于买了一副扑克牌
    _poker = [[Poker alloc] init];
//创建游戏
    _game = [[Game alloc] initWithCardCount:_buttons.count inPoker:_poker];
//刷新界面
    [self showCards];
}

//显示随机的纸牌到按钮上
- (void)showCards{
    for (UIButton *button in _buttons) {
//获取按钮在按钮数组中的下标，索引值
        NSInteger index = [_buttons indexOfObject:button];
//按照这个索引值找到纸牌数组中对应的纸牌
        Card *c = _game.allRandomCards[index];
//将纸牌的大小显示在按钮上
//c.isFaceUp?cardInfo :@""; 面朝上则值等于c.rank, 面朝下则等于@"",空字符串
        [button setTitle:c.isFaceUp?c.cardInfo :@"" forState:UIControlStateNormal];
//显示卡牌的背景图
        UIImage *img = [UIImage imageNamed:c.isFaceUp?@"cardfront":@"cardback"];
        [button setBackgroundImage:img
                          forState:UIControlStateNormal];
//如果按钮已经被匹配了，那么按钮应该是不可用的
// matched YES    enable  NO
// matched  NO    enable  YES
        button.enabled = !c.matched;
    }
//    显示分数
    _scoreLb.text = [NSString stringWithFormat:@"分数:%ld", _game.score];
}

- (IBAction)touchCard:(id)sender {
//测试 属性和方法连接是否正确
//1.获取按钮在buttons数组中的索引值
    NSInteger index = [_buttons indexOfObject:sender];
//    _scoreLb.text = [NSString stringWithFormat:@"%ld", index];
//通知game对象，某一张牌被点击了
    [_game tapCardAtIndex:index];
//刷新界面
    [self showCards];
//    结束！！！
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
