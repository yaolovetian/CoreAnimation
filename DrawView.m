//
//  DrawView.m
//  CoreAnimation
//
//  Created by yao on 2018/1/3.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()<CAAnimationDelegate>

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DrawView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.delegate = self;
    animation.path = self.path.CGPath;
    animation.duration = 5.f;
    animation.repeatCount = 1;
    [[self.superview.subviews lastObject].layer addAnimation:animation forKey:@"position"];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"stroke complete,animation start");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self.path removeAllPoints];
    }
    NSLog(@"animation  stop");
}

@end
