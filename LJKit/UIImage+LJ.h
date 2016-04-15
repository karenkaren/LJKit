//
//  UIImage+LJ.h
//  LJKit
//
//  Created by LiuFeifei on 16/2/26.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LJ)

#pragma mark - 用颜色填充图片
/**
 *  用颜色填充图片
 *
 *  @param color 图片颜色
 *
 *  @return 带纯色的图片
 */
+ (UIImage *)lj_imageWithColor:(UIColor *)color;
+ (UIImage *)lj_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - 生成圆角图片
/**
 *  生成圆角图片
 *
 *  @param radius 圆角半径
 *
 *  @return 圆角图片
 */
- (UIImage *)lj_imageWithCornerRadius:(CGFloat)radius;

#pragma mark - 可以自由拉伸的图片
+ (UIImage *)lj_resizedImage:(NSString *)imgName;
+ (UIImage *)lj_resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;

#pragma mark - 生成二维码
#pragma mark -- 生成黑白色二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize;
#pragma mark -- 生成自定义颜色的二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;
#pragma mark -- 生成自定义颜色、中间带圆角图片的二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue insertImage:(UIImage *)insertImage roundRadius:(CGFloat)roundRadius;
#pragma mark -- 生成黑白色、中间带圆角图片的二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize insertImage:(UIImage *)insertImage roundRadius:(CGFloat)roundRadius;
#pragma mark -- 生成黑白色、中间带圆角图片(圆角为5)的二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize insertImage:(UIImage *)insertImage;
#pragma mark -- 生成自定义颜色、中间带圆角图片(圆角为5)的二维码
+ (UIImage *)lj_imageOfQRFromString:(NSString *)string codeSize:(CGFloat)codeSize red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue  insertImage:(UIImage *)insertImage;

@end
