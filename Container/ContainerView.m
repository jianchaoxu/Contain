//
//  ContainerView.m
//  Container
//
//  Created by 易骏 on 16/6/15.
//  Copyright © 2016年 Tracy. All rights reserved.
//

#import "ContainerView.h"
@interface ContainerView()
@property(nonatomic,assign)CGFloat t;
@end
@implementation ContainerView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGPoint center=CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    if (_view) {
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:-M_PI endAngle:M_PI clockwise:1];
        [path addLineToPoint:CGPointMake(self.frame.size.width/2-80, self.frame.size.height/2)];
        [path addClip];
        [path setLineWidth:1];
        [path setLineCapStyle:kCGLineCapRound];
        [path stroke];
    }else{
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:65 startAngle:-M_PI endAngle:M_PI clockwise:1];
        [path addLineToPoint:CGPointMake(self.frame.size.width/2-65, self.frame.size.height/2)];
        [path addClip];
        [path setLineWidth:4];
        [path setLineCapStyle:kCGLineCapRound];
        [path stroke];
    }
   
    
   //wave
    CGPoint zero=CGPointMake(0, self.bounds.size.height*(1-_value));
    UIBezierPath *wave=[UIBezierPath bezierPath];
    [wave moveToPoint:zero];
    for (int i=0; i<self.bounds.size.width; i++) {
        CGPoint p=relativeCoor(zero, i, 3*sin(M_PI /50 *i + _t ));
        [wave addLineToPoint:p];
    }
    [wave addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [wave addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [[UIColor cyanColor]set];
    [wave fill];
    
}
-(void)didMoveToSuperview{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(change) userInfo:nil repeats:YES];
    [timer fire];
}
-(void)change{
    _t += M_PI * 0.02;
    if (_t == M_PI * 2) {
        _t = 0;
    }
    [self setNeedsDisplay];
}
CGPoint relativeCoor(CGPoint point, CGFloat x ,CGFloat y){
    return CGPointMake(point.x + x, point.y + y);
}
@end
