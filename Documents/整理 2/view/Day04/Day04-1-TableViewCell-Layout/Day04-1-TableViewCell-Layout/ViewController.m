//
//  ViewController.m
//  Day04-1-TableViewCell-Layout
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "MusicCell.h"
#import "TRMusicGroup.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) TRMusicGroup *musicGroup;
@end
@implementation ViewController
- (TRMusicGroup *)musicGroup{
    if (!_musicGroup) {
        _musicGroup = [TRMusicGroup fakeData][0];
    }
    return _musicGroup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.musicGroup.musics.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicCell"];
    TRMusic *music = self.musicGroup.musics[indexPath.row];
//  把数据项传入到cell中，让cell显示。
    cell.music = music;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
