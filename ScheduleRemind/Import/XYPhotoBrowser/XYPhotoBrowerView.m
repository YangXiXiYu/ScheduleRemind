//
//  XYPhotoBrowerView.m
//  AppointmentClass_Student
//
//  Created by MAC on 17/8/23.
//  Copyright © 2017年 liuxiangyu. All rights reserved.
//

#import "XYPhotoBrowerView.h"
#import "AllHongTool.h"
#import "UIView+HQWBExtension.h"
@implementation XYPhotoBrowerView

+ (instancetype)xyPhotoBrowerViewWithFrame:(CGRect)frame PhotoArray:(NSMutableArray *)photoArray{
    XYPhotoBrowerView *view = [[XYPhotoBrowerView alloc]initWithFrame:frame AndPhotoArray:photoArray];
    return view;
}
- (instancetype)initWithFrame:(CGRect)frame AndPhotoArray:(NSMutableArray *)photoArray{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backTapAction)];
        [self addGestureRecognizer:backTap];
        [self initViewBackViewWithPhotoArray:photoArray];
    }
    return self;
}

- (void)backTapAction{
    [self removeFromSuperview];
}
- (void)initViewBackViewWithPhotoArray:(NSMutableArray *)photoArray{
    UIScrollView *scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(US_W * photoArray.count, US_H);
    [self addSubview:scrollView];
    for (int i = 0; i < photoArray.count; i++) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(US_W * i, 0, US_W, US_H)];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.7;
        [scrollView addSubview:backView];
        UIImage *img = photoArray[i];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(US_W * i, 0, US_W, US_W * img.size.height / img.size.width)];
        imgView.image = img;
        imgView.centerY = self.centerY;
        [scrollView addSubview:imgView];
    }
}
@end










