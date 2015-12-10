//
//  CAAnimatiomGroupViewController.m
//  CoreAnimation
//
//  Created by qingyun on 15/12/8.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "CAAnimatiomGroupViewController.h"

@interface CAAnimatiomGroupViewController ()
@property (nonatomic, strong)CALayer *ctmLayer;
@end

@implementation CAAnimatiomGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayers];
    // Do any additional setup after loading the view.
}

- (void)setupLayers {
    //创建
    _ctmLayer = [CALayer layer];
    //属性
    //外观
    _ctmLayer.backgroundColor = [UIColor redColor].CGColor;
    _ctmLayer.cornerRadius = 25;
    //尺寸
    _ctmLayer.bounds = CGRectMake(0, 0, 200, 200);
    _ctmLayer.position = CGPointMake(180, 300);
    //添加
    [self.view.layer addSublayer:_ctmLayer];
    //为图层添加动画
    [self addAnimation:_ctmLayer];
}

- (void)addAnimation:(CALayer *)layer {
    //1.sale
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.duration = 2.f;
    scaleAnim.toValue = @1.3;
    scaleAnim.fillMode = kCAFillModeBoth;
    
    //2.rotation
    CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnim.toValue = @M_PI_4;
    rotationAnim.duration = .5;
    rotationAnim.beginTime = .5;
    rotationAnim.fillMode = kCAFillModeBoth;
    
    //3.backgroundColor
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.toValue = (__bridge id)([UIColor blueColor].CGColor);
    colorAnim.duration = 1.5f;
    colorAnim.beginTime = .5;
    colorAnim.fillMode = kCAFillModeForwards;
    
    //4.动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scaleAnim,rotationAnim,colorAnim];
    group.duration = 2.f;
    group.repeatCount = FLT_MAX;
    group.autoreverses = YES;
    
    //5.添加
    [layer addAnimation:group forKey:nil];
}

@end
















