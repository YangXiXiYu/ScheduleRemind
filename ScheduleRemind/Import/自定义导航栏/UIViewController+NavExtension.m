//
//  UIViewController+NavExtension.m
//  AutoCell
//
//  Created by MAC on 17/4/28.
//  Copyright © 2017年 liuxiangyu. All rights reserved.
//

#import "UIViewController+NavExtension.h"
#import <objc/runtime.h>
@implementation UIViewController (NavExtension)
- (BOOL)fullScreenPopEnabled{
    return  [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setFullScreenPopEnabled:(BOOL)fullScreenPopEnabled{
    objc_setAssociatedObject(self, @selector(fullScreenPopEnabled), @(fullScreenPopEnabled), OBJC_ASSOCIATION_RETAIN);
}
- (XYNavigationController *)navController{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setNavController:(XYNavigationController *)navController{
    objc_setAssociatedObject(self, @selector(navController), navController, OBJC_ASSOCIATION_ASSIGN);
}
@end
