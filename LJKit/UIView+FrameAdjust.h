//
//  UIView+FrameAdjust.h
//  LJKit
//
//  Created by LiuFeifei on 16/2/2.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameAdjust)

@property (assign, nonatomic) CGFloat    top;
@property (assign, nonatomic) CGFloat    bottom;
@property (assign, nonatomic) CGFloat    left;
@property (assign, nonatomic) CGFloat    right;

@property (assign, nonatomic) CGFloat    x;
@property (assign, nonatomic) CGFloat    y;
@property (assign, nonatomic) CGPoint    origin;

@property (assign, nonatomic) CGFloat    centerX;
@property (assign, nonatomic) CGFloat    centerY;

@property (assign, nonatomic) CGFloat    width;
@property (assign, nonatomic) CGFloat    height;
@property (assign, nonatomic) CGSize     size;

@end
