//
//  ZLYStatusBarHud.m
//  ZLYStatusBarHud
//
//  Created by pingco on 16/11/10.
//  Copyright © 2016年 pingco. All rights reserved.
//

#import "ZLYStatusBarHud.h"

/** 消息的停留时间 */
static CGFloat const ZLYMessageDuration =2.0;
/** 按钮文字大小*/
#define ZLYMessageFont [UIFont systemFontOfSize:12]

/** 消息的动画时间 */
static CGFloat const ZLYAnimationDuration =0.5;

/** 窗口高度*/
static CGFloat windowH =20;


@implementation ZLYStatusBarHud

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/** 
 *显示窗口
 */
+(void)showWindow
{
    //frame数据
 
    CGRect frame =CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //窗口
    window_.hidden =YES;//防止有白线残留现象
    window_ =[[UIWindow alloc]init];
    window_.backgroundColor =[UIColor blackColor];
    window_.windowLevel =UIWindowLevelAlert;
    window_.frame =frame;
    window_.hidden =NO;
    
    //动画
    frame.origin.y =0;
    [UIView animateWithDuration:ZLYAnimationDuration animations:^{
        
        window_.frame =frame;
        
    }];
    
}
/**
 * 显示普通信息
 * @param msg 文字
 * @param image 图片
 */
+(void)zly_showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    //显示窗口
    [self showWindow];
    
    //添加按钮
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font =ZLYMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets =UIEdgeInsetsMake(0, 10, 0, 0);
        
    }
    button.frame =window_.frame;
    [window_ addSubview:button];
    
    //定时器
    timer_ =[NSTimer scheduledTimerWithTimeInterval:ZLYMessageDuration target:self selector:@selector(zly_hide) userInfo:nil repeats:NO];
    
    
    
    
}

/**
 * 显示普通信息
 * @param msg 文字
 */
+(void)zly_showMessage:(NSString *)msg
{
    [self zly_showMessage:msg image:nil];
}

/**
 * 显示成功信息
 */
+(void)zly_showSuccess:(NSString *)msg
{
    
    [self zly_showMessage:msg image:[UIImage imageNamed:@"ZLYStatusBarHud.bundle/success"]];
}


/**
 * 显示失败信息
 */
+(void)zly_showError:(NSString *)msg
{
    [self zly_showMessage:msg image:[UIImage imageNamed:@"ZLYStatusBarHud.bundle/error"]];
}

/**
 * 显示正在处理的信息
 */
+(void)zly_showLoading:(NSString *)msg
{
    //取消定时器
    [timer_ invalidate];
    timer_ =nil;
    
    
    //显示窗口
    [self showWindow];
    
    //添加文字
    UILabel *label =[[UILabel alloc]init];
    label.font =ZLYMessageFont;
    label.textColor =[UIColor whiteColor];
    label.frame =window_.frame;
    label.textAlignment =NSTextAlignmentCenter;
    label.text =msg;
    [window_ addSubview:label];
    
    //添加圆圈
    UIActivityIndicatorView *loadView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    //文字宽度
    CGFloat msgW =[msg sizeWithAttributes:@{NSFontAttributeName:ZLYMessageFont}].width;
    CGFloat centerX =(window_.frame.size.width -msgW)*0.5 -20;
    CGFloat centerY =window_.frame.size.height*0.5;
    loadView.center =CGPointMake(centerX, centerY);
    [window_ addSubview:loadView];
    
}

/**
 * 隐藏
 */
+(void)zly_hide
{
    
    [UIView animateWithDuration:ZLYAnimationDuration animations:^{
      
        CGRect frame =window_.frame;
        frame.origin.y = -windowH;
        window_.frame =frame;
        
    } completion:^(BOOL finished) {
        
        window_ =nil;
        timer_ =nil;
    }];
}

/**
 * 显示其他
 */
+(void)zly_showXXX
{
    
}

@end
