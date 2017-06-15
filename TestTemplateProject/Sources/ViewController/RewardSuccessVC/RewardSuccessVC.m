//
//  RewardSuccessVC.m
//  散花效果
//
//  Created by mac on 17/5/8.
//  Copyright © 2017年 YJ. All rights reserved.
//

#import "RewardSuccessVC.h"
#import "RewardSuccess.h"

@interface RewardSuccessVC ()

@end

@implementation RewardSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickButton:(UIButton *)sender {
    [RewardSuccess show];
}


@end
