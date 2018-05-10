//
//  CAKeyFrameViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/2.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "CAKeyFrameViewController.h"
#import "DrawView.h"

@interface CAKeyFrameViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation CAKeyFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关键帧动画";
    self.view.backgroundColor = [UIColor whiteColor];
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
    [self.view addSubview:self.label];
    [self.view addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"1.jpg"];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
        _label.numberOfLines = 0;
        _label.text = @"请开始你的表演，开始画线，图片会跟着线的轨迹走动";
        _label.textColor = [UIColor redColor];
    }
    return _label;
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
