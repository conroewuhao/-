//
//  GuodongViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/25.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "GuodongViewController.h"
#import "RYCuteView.h"//果冻效果



@interface GuodongViewController ()

@end

@implementation GuodongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    RYCuteView *cuteView = [[RYCuteView alloc] initWithFrame:CGRectMake(0, 200, 320, 568)];
    cuteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cuteView];

    
    
}


@end
