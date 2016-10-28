//
//  CGComposeViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/3.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "CGComposeViewController.h"
#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "CGTextView.h"

@interface CGComposeViewController ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITextViewDelegate> {
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    
    CGFloat _itemWH;
    CGFloat _margin;
    LxGridViewFlowLayout *_layout;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) CGTextView *textView;
//选中的图片
@property (nonatomic,strong) NSArray *imageArray;


//选择发布模块的3按钮
/**
 *  VR硬件
 */
@property (weak ,nonatomic)UIButton* VRHardwareBtn;
/**
 *  资讯
 */
@property (weak,nonatomic)UIButton* informationBtn;
/**
 *  VR内容
 */
@property (weak,nonatomic)UIButton* VRContentBtn;
@end

@implementation CGComposeViewController

//-(NSArray *)imageArray{
//    if (!_imageArray) {
//        self.imageArray = [NSArray array];
//    }
//    return _imageArray;
//}

-(void)setImageArray:(NSArray *)imageArray{
    WS(ws)
    if (_imageArray.count > 4 && imageArray.count <5) {
//        [_collectionView makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(ws.view.top);
//            make.left.equalTo(ws.view.left).offset(_margin);
//            make.width.equalTo(@(self.view.tz_width - 2 * _margin));
//            make.height.equalTo(@150);
//        }];
        _collectionView.mj_h = AdjustW(150);
        [_textView updateConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(CGRectGetMaxY(self.collectionView.frame), _margin, 300, _margin));
            make.top.equalTo(ws.view.top).offset(CGRectGetMaxY(_collectionView.frame));
        }];
        self.textView.placeholder = @"说点什么...(限500字)";
    }
    if (_imageArray != imageArray) {
        _imageArray = imageArray;
    }
}

-(CGTextView *)textView{
    if (!_textView) {
        _textView = [[CGTextView alloc]init];
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedPhotos = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];

    //设置图片框
    [self configCollectionView];
    
    //添加文本输入框
    [self addTextView];
    
    //发布板块
    [self addComposeModule];
    self.imageArray = [NSArray array];
}

- (void)configCollectionView {
    _layout = [[LxGridViewFlowLayout alloc] init];
    _margin = 10;
    _itemWH = (self.view.tz_width - 2 * _margin - 4) / 5 - _margin;
    _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    _layout.minimumInteritemSpacing = _margin;
    _layout.minimumLineSpacing = _margin;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(_margin, 0, self.view.tz_width - 2 * _margin,60+ _itemWH+_margin*2) collectionViewLayout:_layout];

    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(4, 0, 0, 2);
    _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, -2);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    
}

-(void)addTextView{
    [self.view addSubview:self.textView];
    WS(ws)
    [_textView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(CGRectGetMaxY(self.collectionView.frame), _margin, AdjustH(300), _margin));
    }];
    self.textView.delegate = self;

}

-(void)addComposeModule{
    UIView *composeModule = [[UIView alloc]init];
    [self.view addSubview:composeModule];
    WS(ws)
    [composeModule makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textView.bottom);
        make.left.equalTo(ws.view.left);
        make.right.equalTo(ws.view.right);
        make.bottom.equalTo(ws.view.bottom);
    }];
    //灰色条
    UIView *grayView = [[UIView alloc]init];
    grayView.backgroundColor = UIColorFromRGBA(247, 247, 247, 1);
    [composeModule addSubview:grayView];
    [grayView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(composeModule.top);
        make.left.equalTo(ws.view);
        make.right.equalTo(ws.view);
        make.height.equalTo(@9);
    }];
    
    //label选择发布板块
    UILabel *ModuleLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:14 textAligment:NSTextAlignmentLeft];
    ModuleLabel.text = @"选择发布板块";
    [composeModule addSubview:ModuleLabel];
    [ModuleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayView.bottom).offset(19);
        make.left.equalTo(ws.view.left).offset(13);
        make.right.equalTo(ws.view);
        make.height.equalTo(@15);
    }];
    
    //button
    UIButton *VRHardwareBtn = [CGTool createBtnWithFontSize:14 ImageName:@"box_unselect" SelectedImage:@"box_select" Title:@"VR硬件"];
    [composeModule addSubview:VRHardwareBtn];
    [VRHardwareBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view.centerX);
        make.top.equalTo(ModuleLabel.bottom).offset(33);
        make.size.mas_equalTo(CGSizeMake(AdjustW(67), AdjustH(30)));
    }];
    
    UIButton *informationBtn = [CGTool createBtnWithFontSize:14 ImageName:@"box_unselect" SelectedImage:@"box_select" Title:@"资讯"];
    [composeModule addSubview:informationBtn];
    //默认informationBtn被选中
    informationBtn.selected = YES;
    [informationBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(VRHardwareBtn.left).offset(-AdjustW(44));
        make.top.equalTo(ModuleLabel.bottom).offset(33);
        make.size.mas_equalTo(CGSizeMake(AdjustW(67), AdjustH(30)));
    }];

    
     UIButton *VRContentBtn = [CGTool createBtnWithFontSize:14 ImageName:@"box_unselect" SelectedImage:@"box_select" Title:@"VR内容"];
    [composeModule addSubview:VRContentBtn];
    [VRContentBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(VRHardwareBtn.right).offset(AdjustW(44));
        make.top.equalTo(ModuleLabel.bottom).offset(33);
        make.size.mas_equalTo(CGSizeMake(AdjustW(67), AdjustH(30)));
    }];
    
    [VRHardwareBtn addTarget:self action:@selector(selectModule:) forControlEvents:UIControlEventTouchUpInside];
    [VRContentBtn addTarget:self action:@selector(selectModule:) forControlEvents:UIControlEventTouchUpInside];
    [informationBtn addTarget:self action:@selector(selectModule:) forControlEvents:UIControlEventTouchUpInside];
    self.informationBtn = informationBtn;
    self.VRHardwareBtn = VRHardwareBtn;
    self.VRContentBtn =VRContentBtn;
}

#pragma mark 选择发布模块点击
-(void)selectModule:(UIButton*)btn{
    self.informationBtn.selected =NO;
    self.VRHardwareBtn.selected = NO;
    self.VRContentBtn.selected = NO;
    if ([btn.titleLabel.text isEqualToString:@"资讯"]) {
        self.informationBtn.selected = YES;
    }else if ([btn.titleLabel.text isEqualToString:@"VR硬件"]){
        self.VRHardwareBtn.selected = YES;
    }else if ([btn.titleLabel.text isEqualToString:@"VR内容"]){
        self.VRContentBtn.selected=YES;
    }
    
}

#pragma mark UITextViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark UICollectionView


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png"];
        cell.deleteBtn.hidden = YES;
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count)
    {
        [self pickPhotoButtonClick:nil];
    }
}

- (void)pickPhotoButtonClick:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.selectedAssets = _selectedAssets; // optional, 可选的
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
//        [_collectionView updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@150);
//        }];
        self.imageArray = assets;
        if (assets.count > 4) {
            WS(ws)
            _collectionView.mj_h = AdjustW(220);
//            [_collectionView updateConstraints:^(MASConstraintMaker *make) {
//                make.height.equalTo(@150);
//            }];
            [_textView updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws.view.top).offset(CGRectGetMaxY(_collectionView.frame));
            }];
            _textView.placeholder = @"说点什么";
        }
        
    }];
    
    // Set the appearance
    // 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // Set allow picking video & photo & originalPhoto or not
    // 设置是否可以选择视频/图片/原图
    // imagePickerVc.allowPickingVideo = NO;
    // imagePickerVc.allowPickingImage = NO;
    // imagePickerVc.allowPickingOriginalPhoto = NO;
    
//    [self presentViewController:imagePickerVc animated:YES completion:nil];
    [self.navigationController pushViewController:imagePickerVc animated:YES];
}


- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    if (sourceIndexPath.item >= _selectedPhotos.count || destinationIndexPath.item >= _selectedPhotos.count) return;
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    if (image) {
        [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
        [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
        [_collectionView reloadData];
    }
}

#pragma mark Click Event点击删除图片

- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    self.imageArray = _selectedPhotos;
    [_selectedAssets removeObjectAtIndex:sender.tag];
    _layout.itemCount = _selectedPhotos.count;
    
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
}


#pragma mark TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

/// User finish picking photo，if assets are not empty, user picking original photo.
/// 用户选择好了图片，如果assets非空，则用户选择了原图。
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _layout.itemCount = _selectedPhotos.count;
    [_collectionView reloadData];
    _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
}

/// User finish picking Fvideo,
/// 用户选择好了视频
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    [_selectedPhotos addObjectsFromArray:@[coverImage]];
    _layout.itemCount = _selectedPhotos.count;
    /*
     // open this code to send video / 打开这段代码发送视频
     [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
     NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
     // Export completed, send video here, send by outputPath or NSData
     // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
     
     }];
     */
    [_collectionView reloadData];
    _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
}


@end