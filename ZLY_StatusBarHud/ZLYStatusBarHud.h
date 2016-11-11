//
//  ZLYStatusBarHud.h
//  ZLYStatusBarHud
//
//  Created by pingco on 16/11/10.
//  Copyright © 2016年 pingco. All rights reserved.
//1.2.6   5.6.9    1.10.23 大版本，功能更新版本，bug修复版本号

#import <UIKit/UIKit.h>

@interface ZLYStatusBarHud : NSObject
/**
 * 显示普通信息
 * @param msg 文字
 * @param image 图片
 */
+(void)zly_showMessage:(NSString *)msg image:(UIImage *)image;

/**
 * 显示普通信息
 * @param msg 文字
 */
+(void)zly_showMessage:(NSString *)msg;

/**
 * 显示成功信息
 */
+(void)zly_showSuccess:(NSString *)msg;


/**
 * 显示失败信息
 */
+(void)zly_showError:(NSString *)msg;

/**
 * 显示正在处理的信息
 */
+(void)zly_showLoading:(NSString *)msg;

/**
 * 隐藏
 */
+(void)zly_hide;

/**
 * 显示其他
 */
+(void)zly_showXXX;


@end
