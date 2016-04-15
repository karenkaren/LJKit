//
//  NSString+LJ.h
//  LJKit
//
//  Created by LiuFeifei on 16/4/7.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LJ)

#pragma mark - 用户信息判断
#pragma mark -- 正则匹配手机号
+ (BOOL)isTelphoneNum:(NSString *)text;
- (BOOL)isTelphoneNum;
#pragma mark -- 正则匹配用户身份证号15或18位
+ (BOOL)isUserIdCard:(NSString *)text;
- (BOOL)isUserIdCard;
#pragma mark -- 18位身份证号码校验
+ (BOOL)isValidateIDCardNumber:(NSString *)text;
- (BOOL)isValidateIDCardNumber;
#pragma mark -- 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)isPassword:(NSString *)text;
- (BOOL)isPassword;

#pragma mark - 数字判断
#pragma mark -- 判断是否为N位小数
+ (BOOL)isValidDecimal:(NSString *)text bits:(NSInteger)bits;
- (BOOL)isValidDecimalWithBits:(NSInteger)bits;
#pragma mark -- 判断是否为整数
+ (BOOL)isPureInt:(NSString *)text;
- (BOOL)isPureInt;
#pragma mark -- 判断是否为float型
+ (BOOL)isPureFloat:(NSString *)text;
- (BOOL)isPureFloat;
#pragma mark -- 判断是否为double型
+ (BOOL)isPureDouble:(NSString *)text;
- (BOOL)isPureDouble;
#pragma mark -- 判断是否为纯数字
+ (BOOL)isPureNumberCharacters:(NSString *)text;
- (BOOL)isPureNumberCharacters;

#pragma mark - 字符串处理
#pragma mark -- 用特定字符替换字符串
+ (NSString *)lj_replacedOfString:(NSString *)string range:(NSRange)range withString:(NSString *)replacement;
- (NSString *)lj_replaceInRange:(NSRange)range withString:(NSString *)replacement;

@end
