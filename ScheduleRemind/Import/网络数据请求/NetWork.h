//
//  NetWork.h
//  test
//
//  Created by MAC on 15/12/28.
//  Copyright © 2015年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetWork : NSObject
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,strong) AFNetworkReachabilityManager *netManager;
+ (NetWork *)mainNetWork;
//get的请求
//post的请求
- (void)netWorkPOSTWithDic: (NSDictionary *)dic withMingCheng: (NSString *)mingCheng withAction: (NSString *)action success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
//md5加密方法
- (NSString *)encryptionByMD5:(NSString *)str;
- (void)alertViewWithTitle:(NSString *)tittle message:(NSString *)message cancleBtn:(NSString *)cancleTitle sureBtn:(NSString *)sureTitle sureAction:(void(^)(id action))sureAction;

@end
