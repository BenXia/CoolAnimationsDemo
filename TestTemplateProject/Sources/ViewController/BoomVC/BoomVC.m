//
//  BoomVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "BoomVC.h"
#import "UIView+BNBoom.h"

@interface BoomVC ()

@property (weak, nonatomic) IBOutlet UIImageView *yyImg;
@property (weak, nonatomic) IBOutlet UIImageView *chromeImg;
@property (weak, nonatomic) IBOutlet UIImageView *instrgamImg;
@property (weak, nonatomic) IBOutlet UIImageView *firfoxImg;
@property (weak, nonatomic) IBOutlet UIImageView *githubImg;
@property (weak, nonatomic) IBOutlet UIImageView *sinaImg;

@property (weak, nonatomic) IBOutlet UIButton *boomButton;

@end

@implementation BoomVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)didClickBoomButton:(UIButton *)button {
    button.enabled = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.yyImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.chromeImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.instrgamImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.firfoxImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.githubImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.sinaImg boom];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.boomButton boom];
    });
}

- (IBAction)didClickResetButton:(UIButton *)button {
    self.boomButton.enabled = YES;
    
    [self.boomButton reset];
    [self.yyImg reset];
    [self.chromeImg reset];
    [self.instrgamImg reset];
    [self.firfoxImg reset];
    [self.githubImg reset];
    [self.sinaImg reset];
}

@end


