//
//  UIView+Addition.m
//  smallCourse
//
//  Created by MAC on 16/3/16.
//  Copyright © 2016年 明达. All rights reserved.
//

#define kWight [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kMulriple [UIScreen mainScreen].bounds.size.width / 375.0
#import "UIView+Addition.h"
#import "AppDelegate.h"

@implementation UIView (Addition)

+ (void)showAddLabelViewWithStr: (NSString *)message {
    if (message) {
        if (message.length > 0) {
            UIWindow * window = [UIApplication sharedApplication].keyWindow;
            UIView *showview =  [[UIView alloc]init];
            showview.backgroundColor = [UIColor blackColor];
            showview.alpha = 1.0f;
            showview.layer.cornerRadius = 5.0f;
            showview.layer.masksToBounds = YES;
            [window addSubview:showview];
            CGSize LabelSize =[message sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]}];
            showview.frame = CGRectMake(0, 0, LabelSize.width+30, LabelSize.height+20);
            showview.center = CGPointMake(window.center.x, kHeight - 150);
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(15, 10, LabelSize.width, LabelSize.height);
            label.text = message;
            label.textColor = [UIColor whiteColor];
            if (LabelSize.width > kWight - 40) {
                showview.frame = CGRectMake(0, 0, kWight - 20, LabelSize.height+20);
                showview.center = CGPointMake(window.center.x, window.center.y);
                label.adjustsFontSizeToFitWidth = YES;
                label.frame = CGRectMake(10, 5, kWight - 40, LabelSize.height);
            }
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont boldSystemFontOfSize:15];
            [showview addSubview:label];
            
            [UIView animateWithDuration:3 animations:^{
                showview.alpha = 0;
            } completion:^(BOOL finished) {
                [showview removeFromSuperview];
            }];
        }
    }
    
}

+ (void)showAddUPViewWithStr: (NSString *)message {
    if (message) {
        if (message.length > 0) {
            UIWindow * window = [UIApplication sharedApplication].keyWindow;
            UIView *showview =  [[UIView alloc]init];
            showview.backgroundColor = [UIColor blackColor];
            showview.alpha = 1.0f;
            showview.layer.cornerRadius = 5.0f;
            showview.layer.masksToBounds = YES;
            [window addSubview:showview];
            CGSize LabelSize =[message sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]}];
            showview.frame = CGRectMake(0, 0, LabelSize.width+30, LabelSize.height+20);
            showview.center = CGPointMake(window.center.x, window.center.y);
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(15, 10, LabelSize.width, LabelSize.height);
            label.text = message;
            label.textColor = [UIColor whiteColor];
            if (LabelSize.width > kWight - 40) {
                showview.frame = CGRectMake(0, 0, kWight - 20, LabelSize.height+20);
                showview.center = CGPointMake(window.center.x, window.center.y);
                label.adjustsFontSizeToFitWidth = YES;
                label.frame = CGRectMake(10, 5, kWight - 40, LabelSize.height);
            }
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont boldSystemFontOfSize:15];
            [showview addSubview:label];
            
            [UIView animateWithDuration:3 animations:^{
                showview.alpha = 0;
            } completion:^(BOOL finished) {
                [showview removeFromSuperview];
            }];
        }
    }
    
}



@end
