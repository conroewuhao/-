//
//  SCFreshView.m
//  QQfresh
//
//  Created by 阿城 on 15/11/23.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "SCFreshView.h"

//启始高度
#define kBeginHeight 40
//拖拽高度
#define kDragHeight 90
//启始圆心
#define kCenter CGPointMake(self.bounds.size.width * 0.5, kBeginHeight * 0.5)
//启始半径
#define kRadius 15
//橡皮泥颜色
#define kColor [UIColor grayColor]

typedef NS_ENUM(NSInteger, ReFreshType) {
    ReFreshTypeNomal,
    ReFreshTypeDrag,
    ReFreshTypeFresh,
};

@interface SCFreshView()
@property(assign ,nonatomic) CGFloat CSHeight;
@property (weak, nonatomic) UIScrollView *SCsuperView;
@property (weak, nonatomic) UIActivityIndicatorView *act;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) BOOL animating;
@property (assign, nonatomic,getter=isfreshing) BOOL freshing;
@end

@implementation SCFreshView

-(void)willMoveToSuperview:(UIView *)newSuperview{
    self.SCsuperView = (UIScrollView *)newSuperview;
    self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    self.frame = CGRectMake(0, -kBeginHeight, newSuperview.bounds.size.width, kBeginHeight);
    NSLog(@"%.2f",newSuperview.bounds.size.width);
    [self.SCsuperView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        CGPoint point = [change[@"new"] CGPointValue];

        CGRect frame = self.frame;
        frame.origin.y = point.y ;
        frame.size.height = -point.y;
        self.frame = frame;
        [self setNeedsDisplay];
        
        //是否在回弹或者正在刷新
        if (_animating || _freshing) {
            //结束拖拽
            if (!self.SCsuperView.dragging) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    self.SCsuperView.contentInset = UIEdgeInsetsMake(kBeginHeight, 0, 0, 0);
                }];
            }
            return;
        }
        
        if (-point.y > kDragHeight) {
            [self beginRefresh];
            
        }else{
            _CSHeight = fmaxf(0, -point.y - kBeginHeight);
//            NSLog(@"%.2f",_CSHeight);
        }
        
    }
}

-(void)beginRefresh{
    if (!_act) {
        _animating = YES;
        UIActivityIndicatorView *act = [UIActivityIndicatorView new];
        act.center = kCenter;
        act.color = [UIColor grayColor];
        [self addSubview:act];
        [act startAnimating];
        _act = act;
        
        NSTimer *timer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(changeBack) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;
        
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

-(void)changeBack{
    _CSHeight -= 5;
    [self setNeedsDisplay];
    if (_CSHeight <= 0) {
        [_timer invalidate];
        _timer = nil;
        _animating = NO;
        _freshing = YES;
        
    }
    
}

-(void)endRefresh{
    _freshing = NO;
    [_act removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{

        self.SCsuperView.contentInset = UIEdgeInsetsZero;
    }];
}


-(void)drawRect:(CGRect)rect{

    if (_freshing) {
        return;
    }
    
//    NSLog(@"adjustHeight:%.2f",_CSHeight);
    
    CGFloat rad1 = kRadius - _CSHeight * 0.1;
    CGFloat rad2 = kRadius - _CSHeight * 0.2;
    CGFloat Y = fmaxf(_CSHeight, 0);
    CGFloat rad3;
    if ((rad1 - rad2) > 0) {
        rad3 = (pow(Y, 2)+pow(rad2, 2)-pow(rad1, 2))/(2*(rad1 - rad2));
//        NSLog(@"%f",rad3);
    }
    rad3 = fmax(0, rad3);
    
    CGPoint center2 = relative(kCenter, 0, Y);
    CGPoint center3 = relative(center2, rad2+rad3, 0);
    CGPoint center4 = relative(center2, -rad2-rad3, 0);
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:kCenter radius:rad1 startAngle:0 endAngle:2*M_PI clockwise:1];
    [circle moveToPoint:center2];
    [circle addArcWithCenter:center2 radius:rad2 startAngle:0 endAngle:2*M_PI clockwise:1];
    
    UIBezierPath *circle2 = [UIBezierPath bezierPathWithArcCenter:center3 radius:rad3 startAngle:0 endAngle:2*M_PI clockwise:1];
    [circle2 moveToPoint:center4];
    [circle2 addArcWithCenter:center4 radius:rad3 startAngle:0 endAngle:2*M_PI clockwise:1];
    
    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:kCenter];
    [line addLineToPoint:center3];
    [line addLineToPoint:center2];
    [line addLineToPoint:center4];
    [line closePath];
    
    [line appendPath:circle];
    [kColor setFill];
    [line fill];
    
    [self.backgroundColor setFill];
    [circle2 fill];
    
}

CGPoint relative(CGPoint point, CGFloat x, CGFloat y)
{
    return CGPointMake(point.x + x, point.y + y);
}

@end
