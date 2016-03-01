//
//  BorderAnimationViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/23.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "BorderAnimationViewController.h"
#import "wuhaoView.h"



@interface BorderAnimationViewController ()

@end

@implementation BorderAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    CGRect newRect=self.navigationController.navigationBar.frame;
    
    CALayer *redLayer=[CALayer layer];
    redLayer.frame=CGRectMake(newRect.origin.x, newRect.origin.y+100, 140, 140);
    redLayer.position=self.view.center;
    redLayer.backgroundColor=[UIColor clearColor].CGColor;
    redLayer.borderColor=[UIColor clearColor].CGColor;
    redLayer.borderWidth=5;
    [self.view.layer addSublayer:redLayer];
    
    //显示动画属性borderColor
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    anim.fromValue = (id)[UIColor yellowColor].CGColor;
    anim.toValue = (id)[UIColor redColor].CGColor;
    //转变后的颜色
    redLayer.borderColor = [UIColor redColor].CGColor;
    anim.duration=2;
    anim.repeatCount=5;
    anim.autoreverses=YES;
    // anim.duration = [CATransaction animationDuration];
    anim.timingFunction = [CATransaction animationTimingFunction];
    [redLayer addAnimation:anim forKey:@"myAnimation"];
    

    wuhaoView *testView=[[wuhaoView alloc]initWithFrame:CGRectMake(100, 240, 40, 40)];
    [self.view addSubview:testView];
    
    

}


@end
