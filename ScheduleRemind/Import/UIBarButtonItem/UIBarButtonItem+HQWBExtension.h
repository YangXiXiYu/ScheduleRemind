//
//  UIBarButtonItem+HQWBExtension.h
//  新浪微博
//
//  Created by Mac on 15/6/10.
//  Copyright (c) 2015年 liuxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HQWBExtension)
/**
 *  返回一个只有图片的item
 *
 *  @param target 监听事件的对象
 *  @param action 监听的事件
 *  @param image  显示的图片名称
 *
 *  @return 只有图片的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image;

/**
 *  返回一个只有文字的item  默认是白色
 *
 *  @param target 监听事件的对象
 *  @param action 监听的事件
 *  @param title  显示的文字
 *
 *  @return 只有文字的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;

/**
 *  返回一个只有文字的item
 *
 *  @param target     监听事件的对象
 *  @param action     监听的事件
 *  @param title      显示的文字
 *  @param titleColor 文字的颜色
 *
 *  @return 返回一个只有文字的item 文字的颜色可以自己设置 （默认状态和高亮状态一样）
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title AndTitleColor:(UIColor *)titleColor;

/**
 *  返回一个图片可变的item
 *
 *  @param target        监听事件的对象
 *  @param action        监听的事件
 *  @param image         默认的图片名称
 *  @param selectedImage 选中状态的图片名称
 *
 *  @return 返回一个图片可变的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage;

/**
 *  返回一个有图片 有文字的item
 *
 *  @param target    监听事件的对象
 *  @param action    监听的事件
 *  @param title     显示的文字
 *  @param imageName 图片名称
 *
 *  @return 返回一个有图片 有文字的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Title:(NSString *)title Image:(NSString *)imageName;

@end
