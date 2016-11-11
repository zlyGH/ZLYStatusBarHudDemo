//
//  ViewController.m
//  ZLY_StatusBarHud ZLYStatusBarHudDemoExample
//
//  Created by pingco on 16/11/11.
//  Copyright © 2016年 pingco. All rights reserved.
//

#import "ViewController.h"
#import "ZLYStatusBarHud.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)success:(id)sender {
    
    [ZLYStatusBarHud zly_showSuccess:@"发送成功"];
    
}

- (IBAction)close:(id)sender {
    
    [ZLYStatusBarHud zly_hide];
}

- (IBAction)loading:(id)sender {
    
    [ZLYStatusBarHud zly_showLoading:@"加载中..."];
    
}
- (IBAction)error:(id)sender {
    
    [ZLYStatusBarHud zly_showError:@"加载失败！"];
    
}
- (IBAction)message:(id)sender {
    
    [ZLYStatusBarHud zly_showMessage:@"普通文字" image:[UIImage imageNamed:@"ZLYStatusBarHud.bundle/success"]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
