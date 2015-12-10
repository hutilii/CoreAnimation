//
//  ReplacementImagesViewController.m
//  CoreAnimation
//
//  Created by qingyun on 15/12/9.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ReplacementImagesViewController.h"

@interface ReplacementImagesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong)NSArray *images;
@end

@implementation ReplacementImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _images = @[
                [UIImage imageNamed:@"1-1.jpg"],
                [UIImage imageNamed:@"2.jpg"],
                [UIImage imageNamed:@"3.jpg"],
                [UIImage imageNamed:@"5.jpg"],
                ];
    // Do any additional setup after loading the view.
}

- (IBAction)next:(UIButton *)sender {
    
    CATransition *transition = [CATransition animation];
    
    //transition.type = kCATransitionReveal;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    
    [_imageView.layer addAnimation:transition forKey:nil];
    
    static int index;
    UIImage *image = _images[index];
    _imageView.layer.contents = (__bridge id)(image.CGImage);
    
    index = (index + 1) % _images.count;
}

@end














