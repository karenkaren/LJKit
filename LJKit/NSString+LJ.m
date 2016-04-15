//
//  NSString+LJ.m
//  LJKit
//
//  Created by LiuFeifei on 16/4/7.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "NSString+LJ.h"

@implementation NSString (LJ)

#pragma mark 正则匹配手机号
+ (BOOL)isTelphoneNum:(NSString *)text
{
    return [text isTelphoneNum];
}

- (BOOL)isTelphoneNum
{
    NSString * telRegex = @"^1[34578]\\d{9}$";
    NSPredicate * prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self];
}

#pragma mark 正则匹配用户身份证号15或18位
+ (BOOL)isUserIdCard:(NSString *)text
{
    return [text isUserIdCard];
}

- (BOOL)isUserIdCard
{
    // 正则匹配用户身份证号15或18位
    NSString * idCard = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    // 正则匹配用户身份证号18位
    //    NSString * idCard = @"[0-9]{17}([0-9]|X|x)$";
    NSPredicate * prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idCard];
    return [prediate evaluateWithObject:self];
}


#pragma mark 18位身份证号码校验
+ (BOOL)isValidateIDCardNumber:(NSString *)text
{
    return [text isValidateIDCardNumber];
}

- (BOOL)isValidateIDCardNumber
{
    NSString * cardNo = self;
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i < 17; i++) {
        sumValue += [[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue % 11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

#pragma mark 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)isPassword:(NSString *)text
{
    return [text isPassword];
}

- (BOOL)isPassword
{
    NSString * password = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$";
    NSPredicate * prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", password];
    return [prediate evaluateWithObject:self];
}

#pragma mark 判断是否为N位小数
+ (BOOL)isValidDecimal:(NSString *)text bits:(NSInteger)bits
{
    return [text isValidDecimalWithBits:bits];
}

- (BOOL)isValidDecimalWithBits:(NSInteger)bits
{
    if ([self isPureDouble]) {
        NSRange rang = [self rangeOfString:@"."];
        if (rang.length > 0) {
            NSArray * digitArray = [self componentsSeparatedByString:@"."];
            NSString * decimalPart = digitArray.lastObject;
            return decimalPart.length > bits ? NO : YES;
        }
        return YES;
    } else {
        return NO;
    }
}

#pragma mark 判断是否为整数
+ (BOOL)isPureInt:(NSString *)text {
    return [text isPureInt];
}

- (BOOL)isPureInt
{
    NSScanner * scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark 判断是否为float型
+ (BOOL)isPureFloat:(NSString *)text {
    return [text isPureFloat];
}

- (BOOL)isPureFloat
{
    NSScanner * scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark 判断是否为double型
+ (BOOL)isPureDouble:(NSString *)text {
    return [text isPureDouble];
}

- (BOOL)isPureDouble
{
    NSScanner * scan = [NSScanner scannerWithString:self];
    double val;
    return [scan scanDouble:&val] && [scan isAtEnd];
}

#pragma mark 判断是否为纯数字
+ (BOOL)isPureNumberCharacters:(NSString *)text
{
    return [text isPureNumberCharacters];
}

- (BOOL)isPureNumberCharacters
{
    NSString * string = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (string.length > 0)
    {
        return NO;
    }
    return YES;
}

#pragma mark 用特定字符替换字符串
+ (NSString *)lj_replacedOfString:(NSString *)string range:(NSRange)range withString:(NSString *)replacement
{
    return [string lj_replaceInRange:range withString:replacement];
}

- (NSString *)lj_replaceInRange:(NSRange)range withString:(NSString *)replacement
{
    if (self == nil || [self length]< range.location + range.length) {
        return self;
    }
    NSString * str = [NSString stringWithFormat:@"%@", self];
    NSMutableString * mStr = [[NSMutableString alloc]initWithString:str];
    [mStr replaceCharactersInRange:range withString:[[NSString string] stringByPaddingToLength:range.length withString:replacement startingAtIndex:0]];
    return mStr;
}

@end
