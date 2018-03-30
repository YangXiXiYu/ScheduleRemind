//
//  MainViewController.m
//  ScheduleRemind
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 Liu Xiangyu. All rights reserved.
//

#import "MainViewController.h"
#import "MineViewController.h"
#import "AllHongTool.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"首页";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"出来吧" forState:UIControlStateNormal];
    btn.frame = CGRectMake(200, 100, 300, 40);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(goOutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)goOutAction{
    MineViewController *viewC = [[MineViewController alloc]initWithNibName:@"MineViewController" bundle:nil];
    viewC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    viewC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    viewC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewC animated:YES completion:nil];
}

@end
