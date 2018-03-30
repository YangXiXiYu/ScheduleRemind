//
//  NSString+Extension.h
//  正则表达式
//
//  Created by apple on 14/11/15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)
- (BOOL)isQQ;
- (BOOL)isPhoneNumber;
- (BOOL)isIPAddress;
- (BOOL)isNumberAndZiMu;
//A-Za-z
- (BOOL)isZiMu;
//判断是不是数字
- (BOOL)isNumber;
/**
 *  判断字符串是不是全部都是数字
 *
 *  @return yes  OR  no
 */
- (BOOL)isAllNumber;
/**
 *  数字数组 升/降序排列
 *
 *  @param array    需要排序数组
 *  @param isAscend 是否是升序
 *
 *  @return 拍好序的数组
 */
- (NSArray*)sortWithArray:(NSArray *)array AscendOrder:(BOOL)isAscend;
/**
 *  富文本字符串
 *
 *  @param color  字符颜色
 *  @param font   字体大小
 *  @param range  特效范围
 *  @param isLine 是否加下划线
 *
 *  @return 返回富文本字符串
 */
- (NSMutableAttributedString *)textColor:(UIColor *)color textFont:(CGFloat)font range:(NSRange)range haveUnderline:(BOOL)isLine;
/**
 *  简单的图文混排
 *
 *  @param imageName  图片名称
 *  @param imageSize  图片的大小
 *  @param frontText  图片前的文字
 *  @param behindText 图片后的文字
 *
 *  @return 返回图文混排富文本字符
 */
+ (NSMutableAttributedString *)textAttachmentWithImageName:(NSString *)imageName imageSize:(CGSize)imageSize frontText:(NSString *)frontText behindText:(NSString *)behindText;
- (CGFloat)widthForLabelWithSizeWithFont:(UIFont *)font;
- (CGFloat)heightForLabelWithWight: (CGFloat)myWight TextSize: (CGFloat)textSize;
@end
