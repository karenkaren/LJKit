//
//  ViewController.m
//  LJKit
//
//  Created by LiuFeifei on 16/2/2.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FrameAdjust.h"
#import "UIImage+LJ.h"
#import "NSString+LJ.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage * image = [[UIImage imageNamed:@"01.jpg"] lj_imageWithCornerRadius:100];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 50, 320, 500)];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    NSString * str = @"42.13.1245";
//    str = [str lj_replaceInRange:NSMakeRange(2, 3) withString:@"*#"];
    str = [NSString lj_replacedOfString:str range:NSMakeRange(2, 3) withString:@"*#"];
    NSLog(@"%@", str);
}

@end
