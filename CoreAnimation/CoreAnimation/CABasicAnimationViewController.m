//
//  CABasicAnimationViewController.m
//  CoreAnimation
//
//  Created by qingyun on 15/12/8.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()
@property (nonatomic, strong)CALayer *ctmLayer;
@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLayers];
    // Do any additional setup after loading the view.
}

- (void)createLayers {
    //创建
    _ctmLayer = [CALayer layer];
    //属性设置
    //外观
//    _ctmLayer.backgroundColor = [UIColor redColor].CGColor;
//    _ctmLayer.cornerRadius = 25;
    _ctmLayer.contents = (__bridge id)([UIImage imageNamed:@"1.jpg"].CGImage);
    //几何位置
    _ctmLayer.bounds = CGRectMake(0 , 0, 100, 100);
    _ctmLayer.position = CGPointMake(140, 330);
    //添加
    [self.view.layer addSublayer:_ctmLayer];
    //添加动画
    [self addAnimation:_ctmLayer];
}

- (void)addAnimation:(CALayer *)layer {

    //创建
    //transform.scale是虚拟属性
    CABasicAnimation *animat = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //设置动画属性
    animat.byValue = @1.3;
    animat.duration = .3;
    animat.autoreverses = YES;
    animat.repeatCount = FLT_MAX;
    //添加动画
    [layer addAnimation:animat forKey:nil];
}

@end















