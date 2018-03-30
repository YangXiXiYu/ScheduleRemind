//
//  TypeSelectionOfWineView.h
//  m_d_h
//
//  Created by Mac on 16/4/19.
//  Copyright © 2016年 liuxiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TypeSelectionOfWineViewDelegate <NSObject>
/**
 *  选择了那一内容
 *
 *  @param index 位置
 *  @param name  名称
 */
- (void)selectionIndex:(NSInteger)index AndName:(NSString *)name;

@end
@interface TypeSelectionOfWineView : UIView
@property (nonatomic, weak) id<TypeSelectionOfWineViewDelegate> delegate;

+ (instancetype)TypeSelectionOfWineViewWithFrame:(CGRect)frame AndTitleArray:(NSArray *)titleArray;
- (instancetype)initWithFrame:(CGRect)frame AndTitleArray:(NSArray *)titleArray;
- (void)clickwWithTag:(int)num;
@end
