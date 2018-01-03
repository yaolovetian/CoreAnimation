//
//  CAGroupViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/2.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "CAGroupViewController.h"

@interface CAGroupViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *startBtn;

@end

@implementation CAGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画组";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.startBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"1.jpg"];
    }
    return _imageView;
}

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setFrame:CGRectMake(50, HEIGHT-50, 100, 50)];
        [_startBtn setTitle:@"开始动画" forState:(UIControlStateNormal)];
        _startBtn.backgroundColor = [UIColor redColor];
        [_startBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (void)btnClick:(UIButton *)sender {
    [self animationGroupDemo1];
}

- (void)animationGroupDemo1 {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *position = [CABasicAnimation animationWithKeyPath:@"position"];
    position.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(WIDTH, 200)];
    position.repeatCount = 1;
    position.duration = 20.f;
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @0.5;
    scale.repeatCount = 1;
    scale.duration = 20;
    
    CABasicAnimation *transform = [CABasicAnimation animationWithKeyPath:@"transform"];
    transform.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
    transform.repeatCount = 1;
    transform.duration = 20.f;
    
    group.animations = @[position,scale,transform];
    
    [self.imageView.layer addAnimation:group forKey:nil];
}

- (void)animationGroupDemo2 {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
