//
//  UIColor+HexColor.h
//  Shake-Food
//
//  Created by wuhao on 15/12/28.
//  Copyright © 2015年 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
/**
 *  十六进制颜色转化
 *
 *  @param hexString 十六进制颜色字符串
 *
 *  @return 颜色对象
 */
+(UIColor *)colorWithHexString:(NSString *)hexString;

@end
