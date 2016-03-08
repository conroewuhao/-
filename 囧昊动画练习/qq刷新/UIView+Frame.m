//
//  UIView+Frame.m
//  zhuan pan
//
//  Created by 阿城 on 15/10/15.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark ------X------
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)x{
    return self.frame.origin.x;
}

#pragma mark ------Y------
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

#pragma mark ------W------
-(void)setW:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}
-(CGFloat)w{
    return self.frame.size.width;
}

#pragma mark ------H------
-(void)setH:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}
-(CGFloat)h{
    return self.frame.size.height;
}

@end
