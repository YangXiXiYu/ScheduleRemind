//
//  ViewController.m
//  ScheduleRemind
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Liu Xiangyu. All rights reserved.
//

#import "ViewController.h"
#import "AllHongTool.h"
#import "UIView+HQWBExtension.h"
#import "NetWork.h"
#import "HQtabBarController.h"
#import "CZSingle.h"
#import "MJExtension.h"
#import "JPUSHService.h"
#import <UserNotifications/UserNotifications.h>
@interface ViewController ()
/**
 *  广告图片的显示
 */
@property (nonatomic, strong) UIImageView *advImageView;
/**
 *  跳过Button
 */
@property (nonatomic, strong) UIButton *skipButton;
/**
 *  倒计时的显示Label
 */
@property (nonatomic, strong) UILabel *CountdownLabel;
/**
 *  倒计时的计时器
 */
@property (nonatomic, strong) NSTimer *timer;

/**
 *  记录倒计时的数据
 */
@property (nonatomic, assign) int tempTime;

@end

@implementation ViewController

- (UIImageView *)advImageView{
    if (_advImageView == nil) {
        _advImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, US_W, US_H)];
        _advImageView.userInteractionEnabled = YES;
        _advImageView.image = [UIImage imageNamed:@"qidong"];
        [self.view addSubview:_advImageView];
    }
    return _advImageView;
}
#pragma mark - 初始化跳过的Button
- (UIButton *)skipButton{
    if (_skipButton == nil) {
        _skipButton = [[UIButton alloc] init];
        _skipButton.hidden = YES;
        _skipButton.width = _skipButton.height = 50;
        _skipButton.x = self.advImageView.width - 10 - _skipButton.width;
        _skipButton.y = 10;
        [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_skipButton setTitle:@"跳过" forState:UIControlStateHighlighted];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _skipButton.layer.cornerRadius = _skipButton.width * 0.5;
        _skipButton.clipsToBounds = YES;
        [_skipButton addTarget:self action:@selector(skipButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.advImageView addSubview:_skipButton];
    }
    return _skipButton;
}
#pragma mark - 初始化跳过button的监听事件
- (void)skipButtonClick{
    [self switchViewController];
}
#pragma mark - 初始化倒计时的Label
- (UILabel *)CountdownLabel{
    if (_CountdownLabel == nil) {
        _CountdownLabel = [[UILabel alloc] init];
        _CountdownLabel.width = self.advImageView.width - self.skipButton.width - 10 - 10;
        _CountdownLabel.hidden = YES;
        _CountdownLabel.height = self.skipButton.height;
        _CountdownLabel.x = 0;
        _CountdownLabel.y = self.skipButton.y;
        _CountdownLabel.font = [UIFont systemFontOfSize:16];
        _CountdownLabel.textAlignment = NSTextAlignmentRight;
        _CountdownLabel.textColor = [UIColor whiteColor];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(upData) userInfo:nil repeats:YES];
        self.tempTime = 1;
        _CountdownLabel.text = [NSString stringWithFormat:@"0%d", self.tempTime];
        [self.advImageView addSubview:_CountdownLabel];
    }
    return _CountdownLabel;
}

#pragma mark - 更新倒计时的数据
- (void)upData{
    self.tempTime --;
    if (self.tempTime > 0) {
        self.CountdownLabel.text = [NSString stringWithFormat:@"0%d", self.tempTime];
    } else {
        [self switchViewController];
    }
}

#pragma mark - 切换控制器
- (void)switchViewController{
    [self.timer invalidate];
    HQtabBarController *tb = [[HQtabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tb;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self CountdownLabel];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


@end
