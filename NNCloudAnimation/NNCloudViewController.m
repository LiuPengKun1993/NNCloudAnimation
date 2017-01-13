//
//  NNCloudViewController.m
//  NNCloudAnimation
//
//  Created by 刘朋坤 on 17/1/13.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNCloudViewController.h"
#import "NNCloudView.h"

@interface NNCloudViewController ()

@end

@implementation NNCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NNCloudView *cloudView = [[NNCloudView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    [self.view addSubview:cloudView];
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
