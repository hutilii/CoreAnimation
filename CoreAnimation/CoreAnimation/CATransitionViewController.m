//
//  CATransitionViewController.m
//  CoreAnimation
//
//  Created by qingyun on 15/12/9.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *type;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subType;

@property (nonatomic, strong)CALayer *containerLayer;
@property (nonatomic, strong)CALayer *redLayer;
@property (nonatomic, strong)CALayer *greenLayer;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLayers];
    // Do any additional setup after loading the view.
}

- (void)setLayers {
    _containerLayer = [CALayer layer];
    _containerLayer.bounds = CGRectMake(0, 0, 180, 180);
    _containerLayer.position = CGPointMake(180, 350);
    [self.view.layer addSublayer:_containerLayer];

    _redLayer = [CALayer layer];
    _redLayer.bounds = CGRectMake(0, 0, 180, 180);
    _redLayer.backgroundColor = [UIColor redColor].CGColor;
    _redLayer.position = CGPointMake(90, 90);
    _redLayer.hidden = YES;
    [_containerLayer addSublayer:_redLayer];
    
    _greenLayer = [CALayer layer];
    _greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    _greenLayer.bounds = CGRectMake(0, 0, 180, 180);
    _greenLayer.position = CGPointMake(90, 90);
    _greenLayer.hidden = NO;
    [_containerLayer addSublayer:_greenLayer];
}

- (IBAction)transition:(UIButton *)sender {
    CATransition *transition = [CATransition animation];
    NSArray *types = @[
                       kCATransitionFade,
                       kCATransitionMoveIn,
                       kCATransitionPush,
                       kCATransitionReveal
                       ];
    NSArray *subTypes = @[
                          kCATransitionFromRight,
                          kCATransitionFromTop,
                          kCATransitionFromLeft,
                          kCATransitionFromBottom
                          ];
    NSString *type = types[_type.selectedSegmentIndex];
    NSString *subType = subTypes[_subType.selectedSegmentIndex];
    transition.type = type;
    transition.subtype = subType;
    
    [_containerLayer addAnimation:transition forKey:nil];
    
    _redLayer.hidden = !_redLayer.hidden;
    _greenLayer.hidden = !_greenLayer.hidden;
}

@end















