//
//  ViewController.m
//  Demo02-Audio-Background
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) AVAudioSession *session;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.创建session对象
    self.session = [AVAudioSession sharedInstance];
    //1.1 设定session的分类
    NSError *error = nil;
    [self.session setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (!error) {
        //1.2 激活session
        [self.session setActive:YES error:&error];
    }

    //2.创建player对象
    //2.1 本地音频url
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"AllOfMe" ofType:@"mp3"];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:audioPath] error:&error];
    
    //3.播放音频
    if ([self.player prepareToPlay]) {
        [self.player play];
    }
}



@end
