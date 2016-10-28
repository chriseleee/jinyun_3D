//
//  AccountNumberVC.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/10.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "AccountNumberVC.h"

@interface AccountNumberVC ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**
 *  头像图片
 */
@property(strong,nonatomic)UIImageView *headerImage;
/**
 *  设置完成
 */
@property (strong,nonatomic)UIButton* finishSetBtn;

/**
 *  昵称Label
 */
@property (strong,nonatomic)UITextField* nameLabel;
/**
 *  图片名
 */
@property (strong,nonatomic)NSString* imageName;
@end

@implementation AccountNumberVC

#pragma mark 懒加载
-(UITextField *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [CGTool createTextFieldWithFrame:CGRectZero fontColor:UIColorFromRGBA(193, 193, 193, 1) fontSize:14 textAligment:NSTextAlignmentLeft];
        _nameLabel.placeholder = @"输入昵称";
        [self.view addSubview:_nameLabel];
    }
    return _nameLabel;
}
-(UIButton *)finishSetBtn{
    if (!_finishSetBtn) {
        _finishSetBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_finishSetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_finishSetBtn setTitle:@"完成" forState:UIControlStateNormal];
        _finishSetBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_finishSetBtn setBackgroundColor:UIColorFromRGBA(36, 155, 180, 1)];
        [_finishSetBtn addTarget:self action:@selector(firshSetUP) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_finishSetBtn];
        
    }
    return _finishSetBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor cyanColor];
}

-(void)setUI{
    //图标
    UIImageView *nameImage = [UIImageView shareViewWithName:@"img_wo"];
    //线
    UIView *firstLine = [[UIView alloc]init];
    firstLine.backgroundColor = UIColorFromRGBA(206, 206, 206, 1);
    [self.view addSubview:nameImage];
    [self.view addSubview:firstLine];
    
    //上传头像Label
    UILabel *setUpHeaderL = [CGTool createLabelWithFrame:CGRectZero fontColor:[UIColor blackColor] fontSize:14 textAligment:NSTextAlignmentCenter];
    setUpHeaderL.text = @"上传头像";
    [self.view addSubview:setUpHeaderL];
    //头像图标
    UIImageView *headerImage = [[UIImageView alloc]init];
    //获取帐号信息字典
    NSMutableDictionary* loginDic = [CGFileManager readDocumentfile:kProfileDocument_login ];
    headerImage.image = [UIImage imageNamed:@"img_myphoto"];
    if (loginDic[@"AccountImage"]) {
        setUpHeaderL.text = @"点击头像上传新头像";
    }else{
        setUpHeaderL.text = @"上传头像";
    }
    UITapGestureRecognizer *headImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
    headImageTap.numberOfTouchesRequired = 1;//手指数
    headImageTap.numberOfTapsRequired = 1;//tap次数
    headerImage.userInteractionEnabled = YES;
    headerImage.layer.cornerRadius = AdjustW(50);
    headerImage.layer.masksToBounds = YES;
    [headerImage addGestureRecognizer:headImageTap];
    self.headerImage = headerImage;
    [self.view addSubview:headerImage];
    
    ///约束
    [nameImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(Margin);
        make.centerY.equalTo(self.view.centerY);
        make.size.mas_equalTo(CGSizeMake(AdjustW(18), AdjustH(28)));
    }];
    [firstLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(Margin);
        make.top.equalTo(nameImage.bottom).offset(AdjustH(10));
        make.right.equalTo(self.view.right).offset(-Margin);
        make.height.equalTo(@2);
    }];
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameImage.right).offset(AdjustW(18));
        make.centerY.mas_equalTo(nameImage.centerY);
        make.right.equalTo(firstLine.right);
    }];
    [self.finishSetBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(firstLine.centerX);
        make.top.equalTo(firstLine.bottom).offset(Margin);
        make.size.mas_equalTo(CGSizeMake(AdjustW(265), AdjustH(44)));
    }];
    [setUpHeaderL makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nameImage.top).offset(-Margin);
        make.left.equalTo(firstLine.left);
        make.right.equalTo(firstLine.right);
        make.height.mas_equalTo(@16);
    }];
    [headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(setUpHeaderL.top).offset(-Margin);
        make.centerX.equalTo(self.view.centerX);
        make.size.mas_equalTo(CGSizeMake(AdjustW(100), AdjustW(100)));
    }];
    
}
#pragma mark 上传头像
- (void)clickTap:(UIGestureRecognizer *)clickTap{
    
    
    // 跳转到相机或相册页面
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择头像图片来源" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }];
    [alert addAction:cameraAction];
    [alert addAction:photoAction];
    [self presentViewController:alert animated:YES completion:nil];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    NSLog(@"---------选择图片--------");
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        CGSize size ;
        size = CGSizeMake(100,100);
        
        image = [self imageByScalingAndCroppingForSize:size sourceImage:image];
        
        
        [self.headerImage setImage:image];
        
        [picker dismissViewControllerAnimated:NO completion:nil];
    }
}

#pragma mark-----图片尺寸方法-----
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize sourceImage:(UIImage*)sourceImageTemp
{
    UIImage *sourceImage = sourceImageTemp;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 *  设置完成点击按钮
 */
-(void)firshSetUP{
    NSString *titleName =self.nameLabel.text;
    //获取帐号信息字典
    NSMutableDictionary* loginDic = [CGFileManager readDocumentfile:kProfileDocument_login ];
    if (!loginDic) {
        loginDic = [NSMutableDictionary dictionary];
    }
    [loginDic setObject:self.headerImage forKey:@"AccountImage"];
    [loginDic setObject:titleName forKey:@"AccountName"];
    //保存帐号信息字典
    [CGFileManager writeDocumentFile:kProfileDocument_login forObject:loginDic ];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
