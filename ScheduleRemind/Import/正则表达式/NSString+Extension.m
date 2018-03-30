//
//  NSString+Extension.m
//  正则表达式
//
//  Created by apple on 14/11/15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (BOOL)match:(NSString *)pattern
{
    // 1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    // 2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}
- (BOOL)isZiMu{
    return [self match:@"^[A-Za-z]+$"];
}
- (BOOL)isNumberAndZiMu{
    return [self match:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$"];
}
- (BOOL)isQQ
{
    // 1.不能以0开头
    // 2.全部是数字
    // 3.5-11位
    return [self match:@"^[1-9]\\d{4,10}$"];
}

- (BOOL)isPhoneNumber
{
    // 1.全部是数字
    // 2.11位
    // 3.以13\15\18\17开头
    return [self match:@"^1[3578]\\d{9}$"];
    // JavaScript的正则表达式:\^1[3578]\\d{9}$\
    
}

- (BOOL)isIPAddress
{
    // 1-3个数字: 0-255
    // 1-3个数字.1-3个数字.1-3个数字.1-3个数字
    return [self match:@"^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$"];
}

- (BOOL)isNumber{
    return [self match:@"[0-9]"];
}
- (BOOL)isAllNumber{
    return [self match:@"^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$"];
}
- (NSArray*)sortWithArray:(NSArray *)array AscendOrder:(BOOL)isAscend{
    //block比较方法，数组中可以是NSInteger，NSString（需要转换）
    
    NSComparator finderSort = ^(id string1,id string2){
        
        if ([string1 integerValue] > [string2 integerValue]) {
            if (isAscend) {
                //升序
                return (NSComparisonResult)NSOrderedDescending;
            }else{
                //降序
                 return (NSComparisonResult)NSOrderedAscending;
            }
            
        }else if ([string1 integerValue] < [string2 integerValue]){
            if (isAscend) {
                 return (NSComparisonResult)NSOrderedAscending;
            }else{
                 return (NSComparisonResult)NSOrderedDescending;
            }
           
        }
        else
            return (NSComparisonResult)NSOrderedSame;
    };
    
    //数组排序：
    NSArray *resultArray = [array sortedArrayUsingComparator:finderSort];
    return resultArray;
}

- (NSMutableAttributedString *)textColor:(UIColor *)color textFont:(CGFloat)font range:(NSRange)range haveUnderline:(BOOL)isLine{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font]  range:range];//字体大小
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];//字体颜色
//    [AttributedStr addAttribute:NSKernAttributeName value:@(2) range:NSMakeRange(0,AttributedStr.length)];//字符间隔
    [AttributedStr addAttribute:NSUnderlineStyleAttributeName  value:@(NSUnderlineStyleSingle) range:range];
    [AttributedStr addAttribute:NSUnderlineColorAttributeName  value:[UIColor lightGrayColor] range:range];
    //是否有下划线
    if (isLine) {
        //下划线 下划线颜色
        [AttributedStr addAttribute:NSUnderlineStyleAttributeName  value:@(NSUnderlineStyleSingle) range:range];
        [AttributedStr addAttribute:NSUnderlineColorAttributeName  value:[UIColor blueColor] range:range];
        //删除线  删除线颜色
        [AttributedStr addAttribute:NSStrikethroughStyleAttributeName  value:@(NSUnderlineStyleSingle) range:range];
        [AttributedStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor blueColor] range:range];
    }
    return AttributedStr;
}
+ (NSMutableAttributedString *)textAttachmentWithImageName:(NSString *)imageName imageSize:(CGSize)imageSize frontText:(NSString *)frontText behindText:(NSString *)behindText{
    NSTextAttachment *imageText = [[NSTextAttachment alloc] init];
    imageText.image = [UIImage imageNamed:imageName];
    // 将 NSTextAttachment 转换成 NSAttributedString 属性
    NSAttributedString *imageText_AttributedStr = [NSAttributedString attributedStringWithAttachment:imageText];
    // 将 NSAttributedString 属性 转换成 NSMutableAttributedString
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:imageText_AttributedStr];
    // imageText 前面的文字转换成 NSMutableAttributedString
    NSMutableAttributedString *front_mAttribStr = [[NSMutableAttributedString alloc] initWithString:frontText];
    // 将文字插在图片前面
    [attributedText insertAttributedString:front_mAttribStr atIndex:0];
    
    NSMutableAttributedString *behind_mAttribStr = [[NSMutableAttributedString alloc] initWithString:behindText];
//    [behind_mAttribStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, behindText.length)];
    // 将文字插在图片后面
    [attributedText appendAttributedString:behind_mAttribStr];
    
    // 设置图片的大小
    imageText.bounds = CGRectMake(0, - 5, imageSize.width, imageSize.height);
    
    // 调整行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedText.length)];
    
    return attributedText;

}
//根据宽度计算稿
-(CGFloat)widthForLabelWithSizeWithFont:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
}
- (CGFloat)heightForLabelWithWight: (CGFloat)myWight TextSize: (CGFloat)textSize {
    CGSize size = CGSizeMake(myWight, 1000000);
    
    NSDictionary *font = @{NSFontAttributeName: [UIFont systemFontOfSize:textSize]};
    
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:font context:nil].size.height;
}


@end
