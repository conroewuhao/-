//
//  wuhaoView.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/24.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "wuhaoView.h"

@interface wuhaoView ()


@property(nonatomic,assign)CGGradientRef gradient;

@end


@implementation wuhaoView



-(void)drawRect:(CGRect)rect{
    CGContextRef contextRef=UIGraphicsGetCurrentContext();
    CGGradientRef gradientRef=[self gradient];
    
    CGPoint startPoint=CGPointMake(CGRectGetMidX(self.bounds), 0);
    CGPoint endPoint=CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    
    CGContextDrawLinearGradient(contextRef, gradientRef, startPoint, endPoint, 0);

}

-(CGGradientRef )gradient{
    
    if (_gradient==NULL) {
        CGFloat colorArray[6]={138/255.0f,1.0f,162/255.0f,1.0f,206/255.f,1.0f
        };
        CGFloat locationArray[3]={0.05f,0.45f,0.94f};
        CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceGray();
        _gradient=CGGradientCreateWithColorComponents(colorSpace, colorArray, locationArray, 3);
        CGColorSpaceRelease(colorSpace);
    }
    return _gradient;

}


@end
