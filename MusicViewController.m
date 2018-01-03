//
//  MusicViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/3.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@property (weak, nonatomic) IBOutlet UIView *musicView;

@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.musicView.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (void)createUI {
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = self.musicView.bounds;
    repLayer.instanceColor = [UIColor redColor].CGColor;
    [self.musicView.layer addSublayer:repLayer];
    
    CALayer *layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(15, self.musicView.bounds.size.height);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [repLayer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 1.f;
    animation.keyPath = @"transform.scale.y";
    animation.toValue = @0.1;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [layer addAnimation:animation forKey:nil];
    
    repLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    repLayer.instanceCount = 5;
    repLayer.instanceDelay = 0.3;
    repLayer.instanceColor = [UIColor greenColor].CGColor;
 //   repLayer.instanceGreenOffset = -0.1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
