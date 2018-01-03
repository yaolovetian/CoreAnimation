//
//  SinaViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/3.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "SinaViewController.h"
#import "CLButton.h"

@interface SinaViewController ()

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) CLButton *btn;

@end

@implementation SinaViewController

static int x = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新浪动画";
    [self makeArr];
    
    self.btns = [NSMutableArray array];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH/2, 64, 100, 40);
    [btn setTitle:@"开始动画" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.btns removeAllObjects];
    for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:[CLButton class]]) {
            [subView removeFromSuperview];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)makeArr{
    self.titleArr = @[@"点评",@"更多",@"拍摄",@"相册",@"文字",@"签到"];
    self.imageArr =@[@"tabbar_compose_review",@"tabbar_compose_more",@"tabbar_compose_camera",@"tabbar_compose_photo",@"tabbar_compose_idea",@"tabbar_compose_review"];
}

- (void)change {
    if (x == self.titleArr.count) {
        [_timer invalidate];
    }
    if (self.btns.count > 0) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    }else {
        [self makeButton];
    }
}

- (void)timeChange {
    if (x == self.titleArr.count) {
        x = -1;
        [_timer invalidate];
    }else {
        UIButton *btn = self.btns[x];
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            btn.transform = CGAffineTransformIdentity;
            [self.view addSubview:btn];
        } completion:^(BOOL finished) {
            
        }];
    }
    x++;
}

- (void)makeButton {
    CGFloat btnW = 100;
    NSInteger col = 0;
    NSInteger row = 0;
    NSInteger cols = 3;
    CGFloat margin = (WIDTH - cols*btnW)/(cols+1);
    for (int i = 0; i<self.titleArr.count; i++) {
        col = i%cols;
        row = i/cols;
        self.btn = [CLButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame = CGRectMake((btnW+margin)*col+margin, row*(margin+btnW)+200, btnW, btnW);
        [self.btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [self.btn setImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
        self.btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        [self.btns addObject:self.btn];
        if (self.btns.count == 6) {
            [self change];
        }
    }
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
