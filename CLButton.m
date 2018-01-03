//
//  CLButton.m
//  CoreAnimation
//
//  Created by yao on 2018/1/3.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "CLButton.h"

@implementation CLButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, imageW, titleH);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1.f animations:^{
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(2.0, 2.0);
        self.alpha = 0;
    }];
}

@end
