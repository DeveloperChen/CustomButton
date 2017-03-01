//
//  ViewController.m
//  按钮动画
//
//  Created by 陈永辉 on 16/11/16.
//  Copyright © 2016年 Chenyonghui. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet CustomButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.button.isShow = YES;
}
- (IBAction)touchAction:(UIControl *)sender {
    self.button.isShow = !self.button.isShow;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
