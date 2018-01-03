//
//  CABaseViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/2.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "CABaseViewController.h"

@interface CABaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;

@end
/*
 removedOnCompletion: default is YES,if YES,the layer.animation will remove from the layer,restore to the initial state.if you want to keep the layer.animation state,we can set 'removedOnCompletion' NO and set fillMode.
 fillMode:
   CA_EXTERN NSString * const kCAFillModeForwards
   CA_EXTERN NSString * const kCAFillModeBackwards
   CA_EXTERN NSString * const kCAFillModeBoth
   CA_EXTERN NSString * const kCAFillModeRemoved
 has four types.
 */
@implementation CABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"基础动画";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.imageView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-200, self.view.bounds.size.width, 200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"1.jpg"];
    }
    return _imageView;
}

- (NSArray *)dataSource {
    return @[@"位移",@"缩放",@"旋转",@"闪烁动画",@"圆角"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            [self movePosition];
        }
            break;
        case 1:
        {
            [self scaleView];
        }
            break;
        case 2:
        {
            [self rotateView];
        }
            break;
        case 3:
        {
            [self alphaView];
        }
            break;
        case 4:
        {
            [self cornerRadiusView];
        }
            break;
        default:
            break;
    }
}

#pragma mark - action

- (void)movePosition {
    CABasicAnimation *basicAni = [CABasicAnimation animation];
    basicAni.keyPath = @"position";
    basicAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    basicAni.toValue = [NSValue valueWithCGPoint:CGPointMake(WIDTH*1.5,200)];
    basicAni.duration = 3.f;
    basicAni.repeatCount = 3;
    basicAni.speed = 0.2f;
    basicAni.fillMode = kCAFillModeForwards;
    /*
     
     */
    //basicAni.removedOnCompletion = YES;
    //basicAni.autoreverses = NO;
    [self.imageView.layer addAnimation:basicAni forKey:@"position"];
}

- (void)scaleView {
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni.toValue = @2;
    basicAni.duration = 1.f;
    basicAni.removedOnCompletion = NO;
    basicAni.fillMode = kCAFillModeForwards;
    [self.imageView.layer addAnimation:basicAni forKey:@"transform.scale"];
}

- (void)rotateView {
   /*
    transform.scale 比例转换
    transform.scale.x
    transform.scale.y
    transform.rotation.z
    */
    CABasicAnimation *baseAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    baseAni.duration = 2.f;
    
    baseAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 10)];
    baseAni.fillMode = kCAFillModeForwards;
    baseAni.removedOnCompletion = NO;
    baseAni.repeatCount = 1;
    [self.imageView.layer addAnimation:baseAni forKey:@"transform"];
}

- (void)alphaView {
    CABasicAnimation *baseAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    baseAni.fromValue = @(1.f);
    baseAni.toValue = @(0.4f);
    baseAni.duration = 2.f;
    baseAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    baseAni.autoreverses = YES;
    [self.imageView.layer addAnimation:baseAni forKey:@"opacityTimes"];
}

- (void)cornerRadiusView {
    CABasicAnimation *baseAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    baseAni.duration = 1.f;
    baseAni.fromValue = @(0);
    baseAni.toValue = @(30.f);
    baseAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    baseAni.repeatCount = 1;
    baseAni.autoreverses = YES;
    [self.imageView.layer addAnimation:baseAni forKey:@"cornerRadius"];
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
