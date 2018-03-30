//
//  CZSingle.h
//  m_d_h
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 liuxiangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HQSingleton.h"
//#import "User.h"
@interface CZSingle : NSObject
HQSingletonH(CZSingle)

/**
 * 用户信息
 */
//@property (nonatomic, strong) User *user;
/**
 * 记录登录异常的BOOL变量
 */
@property (nonatomic, assign) BOOL isLogin;
/**
 * 网络状态0：没网络 1：蜂窝移动网络  2：WIFi
 */
@property (nonatomic, assign) int networkType;
/**
 * 课程设置 是否通知
 */
@property (nonatomic, assign) BOOL isNotice;
/**
 * 课程设置 课时时长
 */
@property (nonatomic, copy) NSString * classTime;


@property (nonatomic, assign) BOOL isFirstLogin;
/**
 * 是否第一次进入
 */
@property (nonatomic, assign) BOOL isFirstInCalendar;
/**
 * 未读消息数量
 */
@property (nonatomic, assign) int messageCount;
@end








