//
//  XYNavigationController.m
//  AutoCell
//
//  Created by MAC on 17/4/28.
//  Copyright © 2017年 liuxiangyu. All rights reserved.
//

#import "XYNavigationController.h"
#import "UIViewController+NavExtension.h"
#import "UIBarButtonItem+HQWBExtension.h"
#import "AllHongTool.h"
@interface XYNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer *popViewControllerGesture;
@property (nonatomic, strong) id popGestureDelegate;
@end

@implementation XYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.navigationBar.translucent = NO;
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeThem) name:@"CHANGE_THEME_NOTIFICATION" object:nil];
   
}
- (void)changeThem{
    self.navigationBar.barTintColor = [UIColor redColor];
}
//初始化手势  调用系统边缘滑动
- (UIPanGestureRecognizer *)popViewControllerGesture{
    if (_popViewControllerGesture == nil) {
         SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        _popViewControllerGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
        _popViewControllerGesture.maximumNumberOfTouches = 1;
    }
    return _popViewControllerGesture;
}
//UINavigationControllerDelegate 跟控制器移除手势 不是根控制器添加手势
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController.fullScreenPopEnabled) {
         [viewController.view addGestureRecognizer:self.popViewControllerGesture];
    }else{
         [viewController.view removeGestureRecognizer:self.popViewControllerGesture];
    }
}
//保证每次Push都有返回箭头 都有返回手势
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"login_icon_back"];
        viewController.fullScreenPopEnabled = YES;
    }
    [super pushViewController:viewController animated:YES];
}
//第一次使用这个类的时候就会调用这个方法
+ (void)initialize{
    [[UINavigationBar appearance] setBarTintColor:APP_GreCOLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];
}
//返回控制器
- (void)back{
    [self popViewControllerAnimated:YES];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CHANGE_THEME_NOTIFICATION" object:nil];
}
@end


