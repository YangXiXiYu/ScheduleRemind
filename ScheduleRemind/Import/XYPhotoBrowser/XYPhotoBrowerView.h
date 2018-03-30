//
//  XYPhotoBrowerView.h
//  AppointmentClass_Student
//
//  Created by MAC on 17/8/23.
//  Copyright © 2017年 liuxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPhotoBrowerView : UIView
- (instancetype)initWithFrame:(CGRect)frame AndPhotoArray:(NSMutableArray *)photoArray;
+ (instancetype)xyPhotoBrowerViewWithFrame:(CGRect)frame PhotoArray:(NSMutableArray *)photoArray;
@end
