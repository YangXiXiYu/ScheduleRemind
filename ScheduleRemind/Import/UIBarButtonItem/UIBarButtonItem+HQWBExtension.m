//
//  UIBarButtonItem+HQWBExtension.m
//  新浪微博
//
//  Created by Mac on 15/6/10.
//  Copyright (c) 2015年 liuxiangyu. All rights reserved.
//

#import "UIBarButtonItem+HQWBExtension.h"
#import "UIView+HQWBExtension.h"
@implementation UIBarButtonItem (HQWBExtension)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image
{
    UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //[backButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    UIImage *tempImage         = [UIImage imageNamed:image];
    backButton.width           = tempImage.size.width;
    backButton.height          = tempImage.size.height;

    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action Title:(NSString *)title Image:(NSString *)imageName{
    UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [backButton setTitle:title forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    CGSize size=CGSizeMake(270, MAXFLOAT);
    
    UIFont *font=[UIFont systemFontOfSize:18];
    
    NSDictionary *attrs=@{NSFontAttributeName:font};
    
    CGSize s=[title boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
              NSStringDrawingUsesLineFragmentOrigin |
              NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
   
    UIImage *tempImage         = [UIImage imageNamed:imageName];
    backButton.width           = tempImage.size.width + s.width;
    backButton.height          = tempImage.size.height;
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    UIImage *tempImage         = [UIImage imageNamed:image];
    backButton.width           = tempImage.size.width;
    backButton.height          = tempImage.size.height;

    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    backButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [backButton sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title AndTitleColor:(UIColor *)titleColor{
    UIButton *backButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitleColor:titleColor forState:UIControlStateNormal];
    [backButton setTitleColor:titleColor forState:UIControlStateHighlighted];
    backButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [backButton sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];

}

@end
