//
//  NetWork.m
//  test
//
//  Created by MAC on 15/12/28.
//  Copyright © 2015年 MAC. All rights reserved.
//

#import "NetWork.h"
#import <CommonCrypto/CommonDigest.h>
#import "CZSingle.h"
#import "MBProgressHUD+MJ.h"
#import "AllHongTool.h"
#import "UIView+Addition.h"
#define URL @"http://192.168.1.110:6035/apis/%@/%@"
//#define URL @"http://yueke2.timeschip.com/apis/%@/%@"//新
@interface NetWork ()
@property (nonatomic, strong) NSString *nonce;
@property (nonatomic, strong) NSString *Sign;
@property (nonatomic, strong) NSString *Time;
@end

@implementation NetWork

+ (NetWork *)mainNetWork {
    static NetWork *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[NetWork alloc] init];
        }
    });
    return manager;
}
//post的请求
- (void)netWorkPOSTWithDic: (NSDictionary *)dic withMingCheng: (NSString *)mingCheng withAction: (NSString *)action success:(void (^)(id json))success failure:(void (^)(NSError *error))failure {
    self.nonce = [self getRandowString];
    self.Time = [NSString stringWithFormat:@"%.0f",[[NSDate date]timeIntervalSince1970]];
    [self appendingStringWithDic:dic];
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [tempDic setObject:self.Time forKey:@"timestamp"];
    [tempDic setObject:@"ios" forKey:@"app_id"];
    [tempDic setObject:self.nonce forKey:@"nonce"];
    [tempDic setObject:self.Sign forKey:@"sign"];
    NSString *tokenStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    NSString *registrationId = [[NSUserDefaults standardUserDefaults]objectForKey:@"registrationId"];
    if (registrationId.length<10) {
        [tempDic setObject:@"" forKey:@"registrationId"];
    }else{
        [tempDic setObject:[NSString stringWithFormat:@"%@",registrationId] forKey:@"registrationId"];
    }
    if (tokenStr.length < 10) {
        [tempDic setObject:@"" forKey:@"token"];
    }else{
        [tempDic setObject:[NSString stringWithFormat:@"%@",tokenStr] forKey:@"token"];
    }
    
    [self.manager POST:[NSString stringWithFormat:URL, mingCheng, action] parameters:tempDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"code"] intValue] == -1) {
            //从新登录
            success(responseObject);
        }else{
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
- (void)appendingStringWithDic: (NSDictionary *)dic {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [tempDic setObject:self.Time forKey:@"timestamp"];
    [tempDic setObject:@"ios" forKey:@"app_id"];
    [tempDic setObject:self.nonce forKey:@"nonce"];
    NSString *registrationId = [[NSUserDefaults standardUserDefaults]objectForKey:@"registrationId"];
    if (!registrationId ||registrationId.length<10) {
        [tempDic setObject:@"" forKey:@"registrationId"];
    }else{
        [tempDic setObject:[[NSString stringWithFormat:@"%@",registrationId]lowercaseString] forKey:@"registrationId"];
    }
    NSString *tokenStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    if (!tokenStr || tokenStr.length < 10) {
        [tempDic setObject:@"" forKey:@"token"];
    }else{
        [tempDic setObject:[[NSString stringWithFormat:@"%@",tokenStr]lowercaseString] forKey:@"token"];
    }
    NSArray *keyArr = [tempDic allKeys];
    NSMutableArray *newKeyArr = [NSMutableArray arrayWithCapacity:1];
    NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithCapacity:1];
    for (NSString *tempKey in keyArr) {
        NSString *tempStr = [tempKey lowercaseString];
        id tempObj = tempDic[tempKey];
        if ([NSStringFromClass([tempObj class]) isEqualToString:@"__NSArrayM"] | [tempStr isEqualToString:@"invoice"] | [tempStr isEqualToString:@"imagebase64"]) {
        }else{
            if ([NSStringFromClass([tempObj class]) isEqualToString:@"__NSDictionary0"] | [NSStringFromClass([tempObj class]) isEqualToString:@"NSNull"]) {
                [newDic setObject:tempDic[tempKey]  forKey:tempStr];
            }else{
                [newDic setObject:[tempDic[tempKey] lowercaseString] forKey:tempStr];
            }
            [newKeyArr addObject:tempStr];
        }
    }
    [newKeyArr sortUsingSelector:@selector(compare:)];
    NSMutableString *signStr = [NSMutableString stringWithCapacity:1];
    for (int i = 0; i < newKeyArr.count; i++) {
        NSString *tempkkey = newKeyArr[i];
        if (i == 0) {
            [signStr appendString:[NSString stringWithFormat:@"%@=%@",tempkkey,newDic[tempkkey]]];
        }else{
            [signStr appendString:[NSString stringWithFormat:@"&%@=%@",tempkkey,newDic[tempkkey]]];
        }
    }
    [signStr appendString:@"&app_secret=b56d49fd3255438a946a66ae2a7003aa"];
    self.Sign = [self encryptionByMD5:signStr];
}
- (NSString *)getRandowString{
    NSString *String = [[[[NSUUID UUID] UUIDString] substringToIndex:8] lowercaseString];//随机字符串
    return String;
}
//md5加密
- (NSString *)encryptionByMD5:(NSString *)str
{
    const char *original_str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:1];
    for (int i = 0; i <  CC_MD5_DIGEST_LENGTH; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash uppercaseString];
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 30.f;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",nil];
        [_manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"ContentType" ];
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    return _manager;
}
- (void)alertViewWithTitle:(NSString *)tittle message:(NSString *)message cancleBtn:(NSString *)cancleTitle sureBtn:(NSString *)sureTitle sureAction:(void(^)(id action))sureAction{
    UIAlertController *allertController = [UIAlertController alertControllerWithTitle:tittle message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleActionBtn = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureActionBtn = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        sureAction(action);
    }];
    [allertController addAction:cancleActionBtn];
    [allertController addAction:sureActionBtn];
    UIWindow *mainWindow  = [UIApplication sharedApplication].keyWindow;
    [mainWindow.rootViewController presentViewController:allertController animated:NO completion:nil];
}


@end
