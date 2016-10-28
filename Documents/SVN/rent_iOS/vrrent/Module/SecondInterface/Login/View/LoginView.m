//
//  LoginView.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "LoginView.h"
#import "JKCountDownButton.h"
#import "Const.h"

@interface LoginView ()

/**
 *  获取的验证码
 */
@property(assign,nonatomic)NSInteger verificationCode;


@end

@implementation LoginView

#pragma mark 懒加载

-(UITextField *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [CGTool createTextFieldWithFrame:CGRectZero fontColor:UIColorFromRGBA(193, 193, 193, 1) fontSize:14 textAligment:NSTextAlignmentLeft];
        _phoneLabel.placeholder = @"输入手机号码";
        [self addSubview:_phoneLabel];
    }
    return _phoneLabel;
}

-(UITextField *)passWLabel{
    if (!_passWLabel) {
        _passWLabel = [CGTool createTextFieldWithFrame:CGRectZero fontColor:UIColorFromRGBA(193, 193, 193, 1) fontSize:14 textAligment:NSTextAlignmentLeft];
        _passWLabel.placeholder = @"输入验证码";
        [self addSubview:_passWLabel];
    }
    return _passWLabel;
}

-(JKCountDownButton *)getPassBtn{
     WS(ws)
    if (!_getPassBtn) {
        _getPassBtn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        [_getPassBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getPassBtn setTitleColor:UIColorFromRGBA(43, 159, 186, 1) forState:UIControlStateNormal];
        [_getPassBtn setTitleColor:[UIColor colorWithRed:0.836 green:0.884 blue:1.000 alpha:1.000]forState:UIControlStateDisabled];
        _getPassBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _getPassBtn.statusCode = YES;
        [self addSubview:_getPassBtn];
        [_getPassBtn addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
            
            
            
            if (_phoneLabel.text.length == 11) {
                sender.enabled = NO;
                //获取验证码的请求
//                [sender startWithSecond:60];
//                
//                [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
//                    NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
//                    return title;
//                }];
//                [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
//                    countDownButton.enabled = YES;
//                    return @"点击重新获取";
//                    
//                }];
                [self toGetPass:sender];
            }else{
               
                [ws phoneAlert];
            }
        }];
        

    }
    return _getPassBtn;
}

#pragma mark UI创建

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AdjustH(250))];
    if (self) {
        [self creatUI];
    }
    return self;
}


-(void)creatUI{
    //图标
    UIImageView *phoneImage = [UIImageView shareViewWithName:@"img_phone"];
    UIImageView *passWImage = [UIImageView shareViewWithName:@"img_passw"];
    
    //线
    UIView *firstLine = [[UIView alloc]init];
    UIView *secondLine = [[UIView alloc]init];
    firstLine.backgroundColor = UIColorFromRGBA(206, 206, 206, 1);
    secondLine.backgroundColor = UIColorFromRGBA(206, 206, 206, 1);
    [self addSubview:phoneImage];
    [self addSubview:passWImage];
    [self addSubview:firstLine];
    [self addSubview:secondLine];
    
    ///约束
    [phoneImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(Margin);
        make.top.equalTo(self.top).offset(Margin);
        make.size.mas_equalTo(CGSizeMake(AdjustW(18), AdjustH(28)));
    }];
    [passWImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(Margin);
        make.top.equalTo(phoneImage.bottom).offset(AdjustH(40));
        make.size.mas_equalTo(CGSizeMake(AdjustW(18), AdjustH(28)));
    }];
    
    [firstLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(Margin);
        make.top.equalTo(phoneImage.bottom).offset(AdjustH(10));
        make.right.equalTo(self.right).offset(-Margin);
        make.height.equalTo(@2);
    }];
    [secondLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(Margin);
        make.top.equalTo(passWImage.bottom).offset(AdjustH(10));
        make.right.equalTo(self.right).offset(-Margin);
        make.height.equalTo(@2);
        
    }];
    
    WS(ws)
    
    [self.getPassBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.right).offset(-Margin);
        make.centerY.mas_equalTo(passWImage.centerY);
        make.size.mas_equalTo(CGSizeMake(AdjustW(100), AdjustH(28)));
    }];
    
    [self.phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneImage.right).offset(AdjustW(18));
        make.centerY.mas_equalTo(phoneImage.centerY);
        make.right.equalTo(firstLine.right);
    }];
    [self.passWLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passWImage.right).offset(AdjustW(18));
        make.centerY.mas_equalTo(passWImage.centerY);
        make.right.equalTo(_getPassBtn.left);
    }];
    
    [self.loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(firstLine.centerX);
        make.bottom.equalTo(ws.bottom).offset(-Margin);
        make.size.mas_equalTo(CGSizeMake(AdjustW(265), AdjustH(44)));
    }];
    
}

#pragma mark 获取验证码按钮点击
-(void)toGetPass:(JKCountDownButton*)sender{
    NSDictionary *parm = nil;
    parm = @{
             @"phone":_phoneLabel.text
             };

    [[NetKit kit]GETWithURLString:@"api/user/sendCode" parameters:parm success:^(id ret) {
        NSLog(@"获取验证码的标识：%@",ret);
        self.verificationCode = [ret[@"body"]integerValue];
        //测试用
        self.passWLabel.text = ret[@"body"];
        NSLog(@"checkout------%ld",(long)self.verificationCode);
        sender.enabled = NO;
        [sender startWithSecond:10];
        [sender didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
            
            return [NSString stringWithFormat:@"%ds",second];
        }];
        [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"获取验证码";
        }];
    } error:^(NSInteger code, NSString *msg, id ret) {
        sender.enabled = YES;
        //103数据为空
        if (code == SERVICE_ERROR_CODE_103) {
            
        }
        [CGTool showHUDText:@"服务器错误"];
    } failure:^(NSError *error) {
        sender.enabled = YES;
        [CGTool showHUDText:@"服务器错误"];
    }];

}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_loginBtn setBackgroundColor:UIColorFromRGBA(36, 155, 180, 1)];
        [_loginBtn addTarget:self action:@selector(firstLogin:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginBtn];
        
    }
    return _loginBtn;
}



#pragma mark 按钮点击事件

-(void)firstLogin:(UIButton*)btn{
    if (_phoneLabel.text == nil || [_phoneLabel.text isEqualToString:@""]||
        _phoneLabel.text.length != 11) {
        
        [self phoneAlert];
    }else if (_passWLabel.text == nil || [_passWLabel.text isEqualToString:@""]){
        
        [self verifyAlert];
    }else if (self.verificationCode == (int)_passWLabel.text ||[_passWLabel.text isEqualToString:[NSString stringWithFormat:@"%ld",(long)self.verificationCode]]){
        NSLog(@"匹配成功");
        
        NSDictionary *parm = nil;
        parm = @{
                 @"phone":_phoneLabel.text,
                 @"code":_passWLabel.text
                 };
        
        [CGTool showHUDProgress:@"加载中"];
        [[NetKit kit]GETWithURLString:@"api/user/login" parameters:parm success:^(id ret) {
            [CGTool removeHUDProgress];
            CGLog(@"我是测试句：%@",ret);
            
            [self.loginDelegate LoginViewToJump];
            //保存帐号
            
            
        } error:^(NSInteger code, NSString *msg, id ret) {
            [CGTool showHUDText:@"服务器错误"];
            [CGTool removeHUDProgress];
        } failure:^(NSError *error) {
            [CGTool showHUDText:@"服务器错误"];
            [CGTool removeHUDProgress];
        }];
        
        
        
    }else{
        [self verifyAlert];
    }

}

- (void)phoneAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号输入格式错误" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [_alertDelegate showAlertView:alert];
    
}

- (void)verifyAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码输入有误" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }]];
    [_alertDelegate showAlertView:alert];
}


@end
