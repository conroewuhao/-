//
//  helpClass.m
//  囧昊动画练习
//
//  Created by wuhao on 16/3/7.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "helpClass.h"

@implementation helpClass
+(CGFloat)getRealWidthInPixal{
    return [UIScreen mainScreen].currentMode.size.width;
}

+(CGFloat)getRealHeightInPixal{
    return [UIScreen mainScreen].currentMode.size.height;
}



@end
