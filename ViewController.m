//
//  ViewController.m
//  CoreAnimation
//
//  Created by yao on 2017/11/21.
//  Copyright © 2017年 yao. All rights reserved.
//

#import "ViewController.h"
#import "CABaseViewController.h"
#import "CAKeyFrameViewController.h"
#import "CAGroupViewController.h"
#import "CATranViewController.h"
#import "DemoViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)dataSource {
    return @[@"BaseAnimation",@"KeyFrameAnimation",@"AnimationGroup",@"TranAnimation",@"AnimationDemo"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
        {
            vc = [CABaseViewController new];
        }
            break;
        case 1:
        {
            vc = [CAKeyFrameViewController new];
        }
            break;
        case 2:
        {
            vc = [CAGroupViewController new];
        }
            break;
        case 3:
        {
            vc = [CATranViewController new];
        }
            break;
        case 4:
        {
            vc = [DemoViewController new];
        }
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
