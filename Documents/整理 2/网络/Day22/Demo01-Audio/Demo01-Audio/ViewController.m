//
//  ViewController.m
//  Demo01-Audio
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//针对音效的系统id对象
@property (nonatomic, assign) SystemSoundID systemSoundID;

//针对播放音频的对象
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation ViewController
- (AVAudioPlayer *)audioPlayer {
    if (!_audioPlayer) {
        //本地音频
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"AllOfMe" withExtension:@"mp3"];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return _audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)playShortAudio:(id)sender {
    //获取音效文件的路径
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"audio" ofType:@"wav"];
    NSURL *url = [NSURL URLWithString:soundPath];
    
    //创建音效文件对应的系统id对象
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &_systemSoundID);
    
    //播放音效
    AudioServicesPlaySystemSound(_systemSoundID);
}
- (IBAction)playLocalAudio:(id)sender {
    [self.audioPlayer play];
    NSLog(@"开始别的逻辑");
}

- (IBAction)pauseAudio:(id)sender {
    //正在播放时暂停
    if (self.audioPlayer.playing) {
        [self.audioPlayer pause];
    }
}
- (IBAction)cancelAudio:(id)sender {
    [self.audioPlayer stop];
    self.audioPlayer = nil;
}







@end
