//
//  AllHongTool.h
//  m_d_h
//
//  Created by Mac on 16/3/8.
//  Copyright © 2016年 liuxiangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define PIAN_YI_OK if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) { \
self.edgesForExtendedLayout = UIRectEdgeBottom; \
};

//app色值
#define APP_GreCOLOR [UIColor colorWithRed:68/255.0 green:210/255.0 blue:99/255.0 alpha:1]
#define APP_RedCOLOR [UIColor colorWithRed:253/255.0 green:72/255.0 blue:92/255.0 alpha:1]
#define APP_BACCOLOR [UIColor colorWithRed:240/255.0 green:241/255.0 blue:242/255.0 alpha:1]
//屏幕尺寸
#define US_W [UIScreen mainScreen].bounds.size.width
#define US_H [UIScreen mainScreen].bounds.size.height
//字体大小
#define Font_16 [UIFont systemFontOfSize:16]
#define Font_14 [UIFont systemFontOfSize:14]
#define Font_12 [UIFont systemFontOfSize:12]
#define Font_10 [UIFont systemFontOfSize:10]
#define Font_8 [UIFont systemFontOfSize:8]
//跳转到登录
#define JUMP_LOGIN_VIEWCONTROLLER if ([json[@"code"] intValue] == -1 || [json[@"code"] intValue] == -2) {\
[[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"token"];\
[self presentViewController:[[LoginViewController alloc]init] animated:YES completion:nil];\
}else{\
    [UIView showAddUPViewWithStr:json[@"msg"]];\
}

//TextField偏移
#define TEXT_PIAN_YI - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{ \
CGFloat offset = self.view.height - (textField.y + textField.height + 216 + 50 + 74); \
if (offset <= 0) { \
    [UIView animateWithDuration:0.3 animations:^{ \
        self.view.y = offset; \
    }]; \
} \
return YES; \
} \
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{ \
    [UIView animateWithDuration:0.3 animations:^{ \
        self.view.y = 0; \
    }]; \
    return YES; \
}
//TextView偏移
#define TEXTVIEW_PIAN_YI - (BOOL)textViewShouldBeginEditing:(UITextView *)textView{\
CGFloat offset1 = self.view.height - textView.y + 49 - 216;\
if (offset1 > 0 ) {\
    [UIView animateWithDuration:0.4 animations:^{\
        if (textView.height - offset1 > 0) {\
            self.view.y = -(textView.height - offset1) + 25;\
        }\
    }];\
}else{\
    [UIView animateWithDuration:0.4 animations:^{\
        self.view.y = -(textView.height - offset1) + 25;\
    }];\
}\
return YES;\
}\
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{\
    [UIView animateWithDuration:0.3 animations:^{\
        self.view.y = 64;\
}];\
    return YES;\
}

//通过SB跳转的控制器
#define SB_TO_NEW_CONTROLLER(newViewController)     UIStoryboard *sb = [UIStoryboard storyboardWithName:newViewController bundle:nil]; \
[self.navigationController pushViewController:[sb instantiateInitialViewController] animated:YES];
//push
#define PUSH(newViewController) [self.navigationController pushViewController:[[newViewController alloc] init] animated:YES];
//pop
#define POP_TO_UP [self.navigationController popViewControllerAnimated:YES];
#define POP_TO_ROOT [self.navigationController popToRootViewControllerAnimated:YES];
//带有RGBA的颜色设置
#define COLOR_RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//没有数据异常
#define NO_HAVE_SHUJU_UNUSUAL_SHOW(tableView,lableText)    UIView *noDateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, US_W, US_H)];\
UILabel *noDatelab = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, US_W, 60)];\
noDatelab.text = lableText;\
noDatelab.textColor = [UIColor lightGrayColor];\
noDatelab.font = [UIFont systemFontOfSize:14];\
noDatelab.textAlignment = NSTextAlignmentCenter;\
[noDateView addSubview:noDatelab];\
[tableView  setBackgroundView:noDateView];\
tableView.backgroundView.hidden = YES;

//没页面加载失败（请求失败），网络不给力（超时）异常
#define LOAD_FAIL_AND_NET_NOT_GOOD(tableView,lableText) UIImageView *unusualImageView = [[UIImageView alloc]initWithFrame:CGRectMake(US_W * 0.5 - 24, US_H * 0.4, 48, 45)]; \
unusualImageView.image = [UIImage imageNamed:@"kongbaiyemian_cuowutishi"]; \
[self.view addSubview:unusualImageView]; \
UILabel *unusualLable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(unusualImageView.frame) + 6, US_W, 20)]; \
unusualLable.text = lableText; \
unusualLable.font = [UIFont systemFontOfSize:12]; \
unusualLable.textAlignment = NSTextAlignmentCenter; \
unusualLable.textColor = [UIColor lightGrayColor]; \
[self.view addSubview:unusualLable]; \
tableView.hidden = YES; \


//json  便利化未为字典
#define JSON_ID(json) [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];


//获取类的属性
#define GET_CLASS_CATEGORY(CLASS_Str) unsigned int numIvars;\
Ivar *vars = class_copyIvarList(NSClassFromString(CLASS_Str), &numIvars);\
NSString *key0=nil;\
NSString *key1=nil;\
for(int i = 0; i < numIvars; i++) {\
    Ivar thisIvar = vars[i];\
    key0 = [NSString stringWithUTF8String:ivar_getName(thisIvar)];\
    key1 = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)]; \
    NSLog(@"变量名 :%@  类型 :%@", key0,key1);\
}\
free(vars);
@interface AllHongTool : NSObject

@end
