//
//  CustomPropertyViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/24.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "CustomPropertyViewController.h"
#import "ClockFace.h"

@interface CustomPropertyViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property(nonatomic,strong)ClockFace *clockFace;

- (IBAction)timeChange:(id)sender;
@end

@implementation CustomPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 
    self.clockFace = [[ClockFace alloc] init];
    self.clockFace.position = CGPointMake(self.view.bounds.size.width / 2, 150+40);
    self.clockFace.position = CGPointMake(self.view.center.x, self.view.center.y);
    [self.view.layer addSublayer:self.clockFace];
    //set default time
    self.clockFace.time = [NSDate date];

//    CAShapeLayer *wuhaoLayer=[CAShapeLayer layer];
//    wuhaoLayer.path=[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 50)].CGPath;
//    wuhaoLayer.fillColor=[UIColor redColor].CGColor;
//    CGPoint point=self.view.center;
//    wuhaoLayer.position=CGPointMake(point.x-100, point.y);
//    [self.view.layer addSublayer:wuhaoLayer];
    
    
}


- (IBAction)timeChange:(id)sender {

    self.clockFace.time=self.datePicker.date;

}



@end
