//
//  CustomButton.m
//  按钮动画
//
//  Created by 陈永辉 on 16/11/16.
//  Copyright © 2016年 Chenyonghui. All rights reserved.
//

#import "CustomButton.h"


@interface CustomButton ()
@property (nonatomic) CAShapeLayer *shaperLayer;
@end

@implementation CustomButton



- (void)setHighlighted:(BOOL)highlighted {

}

- (void)setIsShow:(BOOL)isShow {
    
    _isShow = isShow;
    [self buttonAnimation];
}

- (void)buttonAnimation{
    if (self.shaperLayer) {
        [self.shaperLayer removeFromSuperlayer];
    }
    self.shaperLayer = [CAShapeLayer layer];
    _shaperLayer.fillColor = [UIColor yellowColor].CGColor;
    _shaperLayer.fillColor = [UIColor yellowColor].CGColor;
    _shaperLayer.lineWidth = 1;
    _shaperLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    CGPathRef bound = CGPathCreateCopyByStrokingPath(_shaperLayer.path, nil, _shaperLayer.lineWidth, kCGLineCapRound, kCGLineJoinMiter, _shaperLayer.miterLimit);
    _shaperLayer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    
    _shaperLayer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height/2);
    _shaperLayer.anchorPoint = CGPointMake(0.5, 0.5);
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CGPoint point1 = CGPointZero;
    CGPoint point2 = CGPointZero;
    if (self.isShow) {
        point1 = CGPointMake(0.0, 0.0);
        point2 = CGPointMake(1.0, 1.0);
    }else {
        point1 = CGPointMake(1.0, 1.0);
        point2 = CGPointMake(0.0, 0.0);
    }
    basic.fromValue = [NSValue valueWithCGPoint:point1];
    basic.toValue = [NSValue valueWithCGPoint:point2];
    basic.removedOnCompletion = NO;
    basic.fillMode = kCAFillModeForwards;
    basic.duration = 0.29;
    [_shaperLayer addAnimation:basic forKey:@"transform.scale"];
    [self.layer insertSublayer:_shaperLayer atIndex:0];
}

@end
