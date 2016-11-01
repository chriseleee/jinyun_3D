//
//  ViewController.m
//  Demo03-Video
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (nonatomic, strong) MPMoviePlayerViewController *viewController;
@end

@implementation ViewController
- (MPMoviePlayerViewController *)viewController {
    if (!_viewController) {
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"广告" ofType:@"mov"];
        NSURL *url = [NSURL fileURLWithPath:videoPath];
        _viewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    }
    
    return _viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //只能通过通知来监听视频的播放状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoChange) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];

}
- (void)videoChange {
    switch (self.viewController.moviePlayer.playbackState) {
        case MPMoviePlaybackStateStopped:
            NSLog(@"视频取消播放");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"视频已经暂停了");
            break;
        case MPMoviePlaybackStatePlaying:
            NSLog(@"视频正在播放");
            break;
      
        default:
            break;
    }
}

- (IBAction)playVideo:(id)sender {
    //弹出视图控制器
    [self presentViewController:self.viewController animated:YES completion:nil];
}




@end
