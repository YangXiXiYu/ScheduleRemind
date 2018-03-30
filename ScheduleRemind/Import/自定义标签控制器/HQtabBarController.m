//
//  HQtabBarController.m
//  m_d_h
//
//  Created by Mac on 16/3/8.
//  Copyright © 2016年 liuxiangyu. All rights reserved.
//

#import "HQtabBarController.h"
#import "AllHongTool.h"
#import "XYNavigationController.h"
#import "CZSingle.h"
#import "MainViewController.h"
#import "SettingViewController.h"
#define HQImage(name) [[UIImage imageNamed:(name)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
@interface HQtabBarController ()

@end

@implementation HQtabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    //设置tableBar背景色
    self.tabBar.backgroundColor = APP_GreCOLOR;
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.shadowImage = [[UIImage alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeThem) name:@"CHANGE_THEME_NOTIFICATION" object:nil];
    [self addChildVC:[[MainViewController alloc] init] AndTitle:@"首页" AndImage:@"label_icon_schedule_d" AndSelectedImage:@"label_icon_schedule_s"];
    [self addChildVC:[[SettingViewController alloc] init] AndTitle:@"设置" AndImage:@"label_icon_teacher_d" AndSelectedImage:@"label_icon_teacher_s"];
}
- (void)changeThem{
    self.tabBar.backgroundColor = [UIColor redColor];
}
//对tabbar进行封装
- (void)addChildVC:(UIViewController *)childVC AndTitle:(NSString *)title AndImage:(NSString *)image AndSelectedImage:(NSString *)selectedImage{
    childVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:HQImage(image) selectedImage:HQImage(selectedImage)];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:APP_GreCOLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    XYNavigationController *nav  = [[XYNavigationController alloc] initWithRootViewController:childVC];
    nav.fullScreenPopGestureEnabled = YES;
    [self addChildViewController:nav];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CHANGE_THEME_NOTIFICATION" object:nil];
}

@end
