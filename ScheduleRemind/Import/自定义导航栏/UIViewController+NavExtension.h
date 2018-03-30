//
//  UIViewController+NavExtension.h
//  AutoCell
//
//  Created by MAC on 17/4/28.
//  Copyright © 2017年 liuxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYNavigationController.h"
@interface UIViewController (NavExtension)
@property (nonatomic, assign) BOOL fullScreenPopEnabled;
@property (nonatomic, strong) XYNavigationController *navController;
@end
