//
//  CATranViewController.m
//  CoreAnimation
//
//  Created by yao on 2018/1/2.
//  Copyright © 2018年 yao. All rights reserved.
//

#import "CATranViewController.h"

@interface CATranViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CATranViewController

static int i = 2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return @[@"淡入淡出",@"推挤",@"揭开",@"覆盖",@"立方体",@"吮吸",@"翻转",@"波纹",@"翻页",@"反翻页",@"开镜头",@"关镜头",@"下翻页",@"上翻页",@"左翻转",@"右翻转"];
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
            [self begin:@"fade"];
        }
            break;
        case 1:
        {
            [self begin:@"push"];
        }
            break;
        case 2:
        {
            [self begin:@"reveal"];
        }
            break;
        case 3:
        {
            [self begin:@"moveIn"];
        }
            break;
        case 4:
        {
            [self begin:@"cube"];
        }
            break;
        case 5:
        {
            [self begin:@"suckEffect"];
        }
            break;
        case 6:
        {
            [self begin:@"oglFlip"];
        }
            break;
        case 7:
        {
            [self begin:@"rippleEffect"];
        }
            break;
        case 8:
        {
            [self begin:@"pageCurl"];
        }
            break;
        case 9:
        {
            [self begin:@"pageUnCurl"];
        }
            break;
        case 10:
        {
            [self begin:@"cameraIrisHollowOpen"];
        }
            break;
        case 11:
        {
            [self begin:@"cameraIrisHollowClose"];
        }
            break;
        case 12:
        {
            [self begin:@"curlDown"];
        }
            break;
        case 13:
        {
            [self begin:@"curlUp"];
        }
            break;
        case 14:
        {
            [self begin:@"flipFromLeft"];
        }
            break;
        case 15:
        {
            [self begin:@"flipFromRight"];
        }
            break;
        default:
            break;
    }
}

- (void)begin:(NSString *)str {
    if (i == 4) {
        i = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"%d",i];
    self.imageView.image = [UIImage imageNamed:imageName];
    i++;
    CATransition *ani = [CATransition animation];
    /*
    //subType
    CA_EXTERN NSString * const kCATransitionFromRight
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromLeft
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromTop
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    CA_EXTERN NSString * const kCATransitionFromBottom
    CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
    */
    ani.subtype = kCATransitionFromLeft;
    ani.type = str;
    ani.duration = 2;
    NSString *animation = @"Animation";
    str = [str stringByAppendingString:animation];
    [self.imageView.layer addAnimation:ani forKey:str];
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
