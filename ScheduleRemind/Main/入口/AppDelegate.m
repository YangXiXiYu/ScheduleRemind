//
//  AppDelegate.m
//  ScheduleRemind
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Liu Xiangyu. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "NetWork.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[ViewController alloc]init];
    [self checkNetWork];
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark - 网络监测
- (void)checkNetWork{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            
        }else {
            [[NetWork mainNetWork]alertViewWithTitle:@"提示" message:@"无网络，请检查网络设施！" cancleBtn:@"取消" sureBtn:@"去设置" sureAction:^(id action) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                dispatch_after(0.2, dispatch_get_main_queue(), ^{
                     [[UIApplication sharedApplication]openURL:url];
                });
            }];
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
