//
//  TypeSelectionOfWineView.m
//  m_d_h
//
//  Created by Mac on 16/4/19.
//  Copyright © 2016年 liuxiangyu. All rights reserved.
//

#import "TypeSelectionOfWineView.h"
#import "UIView+HQWBExtension.h"
#import "AllHongTool.h"
#define BOTTOM_HEIGHT 0
@interface TypeSelectionOfWineView ()

/**
 *  标记选择了哪一个内容
 */
@property (nonatomic, strong) UIView *signView;
/**
 *  记录临时选择的内容
 */
@property (nonatomic, strong) UILabel *tempLabel;
/**
 *  记录临时选择的内容
 */
@property (nonatomic, strong) UILabel *tempNumLabel;
/**
 *  记录标记View的移动的X
 */
@property (nonatomic, assign) CGFloat tempX;
@property (nonatomic, assign) BOOL isNomal;
@property (nonatomic, assign) float bottomHeight;
@end

@implementation TypeSelectionOfWineView
+ (instancetype)TypeSelectionOfWineViewWithFrame:(CGRect)frame AndTitleArray:(NSArray *)titleArray{
    TypeSelectionOfWineView *view = [[TypeSelectionOfWineView alloc] initWithFrame:frame AndTitleArray:titleArray];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame AndTitleArray:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        if (frame.size.height == 44) {
            self.isNomal =  YES;
        }else{
            self.bottomHeight = 50;
        }
        [self loadUIWithArray:titleArray];
    }
    return self;
}

#pragma mark - 初始化标记选择的View
- (UIView *)signView{
    if (_signView == nil) {
        _signView = [[UIView alloc] init];
        _signView.height = 2;
        _signView.y = self.height - _signView.height - BOTTOM_HEIGHT;
        _signView.backgroundColor = APP_GreCOLOR;
        [self addSubview:_signView];
    }
    return _signView;
}

#pragma mark - 实现加载UI的方法
- (void)loadUIWithArray:(NSArray *)titleArray{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.width = self.width;
    imageView.height = 1;
    imageView.x = 0;
    imageView.y = self.height - imageView.height;
    imageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:imageView];
    self.signView.width = self.width / titleArray.count;
    self.signView.x = self.width / titleArray.count * 0;
    self.tempX = self.signView.x;
    for (int i = 0; i < titleArray.count; i ++) {
        UIView *view = [[UIView alloc] init];
         view.backgroundColor = [UIColor whiteColor];
        view.width = self.width / titleArray.count;
        view.x = i * view.width;
        view.y = 0;
        view.height = self.height - self.signView.height - BOTTOM_HEIGHT;
        view.tag = i + 120;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(indexClick:)];
        [view addGestureRecognizer:tap];
        [self addSubview:view];
        UILabel *label = [[UILabel alloc] init];
        label.frame = view.frame;
        label.font = [UIFont systemFontOfSize:14];
        label.text = titleArray[i];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = i + 130;
        [self addSubview:label];
        if (i == 0) {
            label.textColor = APP_GreCOLOR;
            self.tempLabel = label;
        }
        if (!self.isNomal) {
            UIView *numView = [[UIView alloc] init];
            numView.backgroundColor = [UIColor whiteColor];
            numView.width = self.width / titleArray.count;
            numView.x = i * numView.width;
            numView.y = self.height - BOTTOM_HEIGHT;
            numView.height = BOTTOM_HEIGHT - 1;
            numView.tag = i + 140;
            UITapGestureRecognizer *numtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(indexClick:)];
            [numView addGestureRecognizer:numtap];
            [self addSubview:numView];
            
            UILabel *numlabel = [[UILabel alloc] init];
            numlabel.userInteractionEnabled = YES;
            numlabel.frame = CGRectMake(numView.width * 0.5 - 15, (BOTTOM_HEIGHT - 30) * 0.5, 30, 30);
            numlabel.font = [UIFont systemFontOfSize:14];
            numlabel.text = @"10";
            numlabel.textColor = [UIColor blackColor];
            numlabel.backgroundColor = [UIColor whiteColor];
            numlabel.textAlignment = NSTextAlignmentCenter;
            numlabel.clipsToBounds = YES;
            numlabel.layer.cornerRadius = 15;
            numlabel.tag = i + 150;
            [numView addSubview:numlabel];
            if (i == 0) {
                numlabel.backgroundColor = APP_RedCOLOR;
                self.tempNumLabel = numlabel;
            }
        }
        
    }
}

#pragma amrk - 实现点击方法
- (void)indexClick:(UITapGestureRecognizer *)tap{
    UILabel *label = [[UILabel alloc]init];
    UILabel *numlabel = [[UILabel alloc]init];
    if (tap.view.tag > 139) {
        label = (UILabel *)[self viewWithTag:tap.view.tag - 140 + 130];
        numlabel = (UILabel *)[self viewWithTag:tap.view.tag - 140 + 150];
    }else{
        label = (UILabel *)[self viewWithTag:tap.view.tag - 120 + 130];
        numlabel = (UILabel *)[self viewWithTag:tap.view.tag - 120 + 150];
    }
    if (label != self.tempLabel) {
        label.textColor = APP_GreCOLOR;
        numlabel.backgroundColor = APP_RedCOLOR;
        self.tempLabel.textColor = [UIColor blackColor];
        self.tempNumLabel.backgroundColor = [UIColor whiteColor];
        self.tempLabel = label;
        self.tempNumLabel = numlabel;
        if ([self.delegate respondsToSelector:@selector(selectionIndex:AndName:)]) {
            [self.delegate selectionIndex:tap.view.tag - 120 AndName:label.text];
        }
        if (tap.view.tag > 139) {
            [UIView animateWithDuration:0.3 animations:^{
                self.signView.x = self.tempX + (tap.view.tag - 140) * (self.signView.width + self.tempX * 2);
            }];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                self.signView.x = self.tempX + (tap.view.tag - 120) * (self.signView.width + self.tempX * 2);;
            }];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(selectionIndex:AndName:)]) {
            [self.delegate selectionIndex:tap.view.tag - 120 AndName:label.text];
        }
    }
}
- (void)clickwWithTag:(int)num{
    UILabel *label = (UILabel *)[self viewWithTag:num - 120 + 130];
    if (label != self.tempLabel) {
        label.textColor = APP_GreCOLOR;
        self.tempLabel.textColor = [UIColor blackColor];
        self.tempLabel = label;
        if ([self.delegate respondsToSelector:@selector(selectionIndex:AndName:)]) {
            [self.delegate selectionIndex:num - 120 AndName:label.text];
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.signView.x = self.tempX + (num - 120) * (self.signView.width + self.tempX * 2);;
        }];
    }

}
@end
