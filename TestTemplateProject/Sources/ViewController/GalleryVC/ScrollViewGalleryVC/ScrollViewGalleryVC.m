//
//  ScrollViewGalleryVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/8/1.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ScrollViewGalleryVC.h"
#import "BQLSlideView.h"

@interface ScrollViewGalleryVC ()

@property (nonatomic, strong) BQLSlideView *slideView;

@end

@implementation ScrollViewGalleryVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *array = @[@"我是第一张",@"我是第二张",@"我是第三张",
                       @"我是第四张",@"我是第五张",@"我是第六张",
                       @"我是第七张",@"我是第八张",@"我是第九张"];
    _slideView = [BQLSlideView cardView:CGRectMake(0, 70, self.view.bounds.size.width, self.view.bounds.size.width)];
    [_slideView setCardViews:array atIndex:0];
    _slideView.transfrom = YES;
    [self.view addSubview:_slideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)didClickPreviousButtonAction:(id)sender {
    [_slideView slideBackwards];
}

- (IBAction)didClickNextButtonAction:(id)sender {
    [_slideView slideForwards];
}

@end


