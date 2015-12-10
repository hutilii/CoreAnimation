//
//  CAKeyframeAnimationViewController.m
//  CoreAnimation
//
//  Created by qingyun on 15/12/9.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

#define halfScreenWidth     ([UIScreen mainScreen].bounds.size.width / 2.0)


@interface CAKeyframeAnimationViewController ()
@property (nonatomic,strong)CALayer *platformLayer;
@property (nonatomic,strong)CALayer *marioLayer;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayers];
    // Do any additional setup after loading the view.
}

- (void)setupLayers {
    //创建platformLayer
    _platformLayer = [CALayer layer];
    _platformLayer.backgroundColor = [UIColor brownColor].CGColor;
    _platformLayer.cornerRadius = 24;
    _platformLayer.bounds = CGRectMake(0, 0, halfScreenWidth+20, 40);
    _platformLayer.position = CGPointMake(halfScreenWidth, 200);
    _platformLayer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:_platformLayer];
    
    //创建marioLayer
    _marioLayer = [CALayer layer];
    _marioLayer.contents = (__bridge id)([UIImage imageNamed:@"Mario"].CGImage);
    _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    _marioLayer.bounds = CGRectMake(0, 0, 32, 62);
    _marioLayer.position = CGPointMake(0, self.view.frame.size.height);
    _marioLayer.anchorPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:_marioLayer];
}

- (IBAction)jump:(UIButton *)sender {
    [CATransaction begin];
    CAKeyframeAnimation *jumpAnima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //把某一部分的动画关掉，用事务
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _marioLayer.contentsRect = CGRectMake(0, 0, 0.5, 1);
    [CATransaction commit];
    
    //设置动画完成后的回调
    [CATransaction setCompletionBlock:^{
        //关闭动画
        [CATransaction setDisableActions:YES];
        _marioLayer.position = CGPointMake(halfScreenWidth+10, 200);
        _marioLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    }];
    
    jumpAnima.duration = 0.7f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.view.frame.size.height);
    CGPathAddCurveToPoint(path, NULL, 30, 140, halfScreenWidth+10, 140, halfScreenWidth+10, 200);
    jumpAnima.path = path;
    
    [_marioLayer addAnimation:jumpAnima forKey:nil];
    [CATransaction commit];
}

@end

