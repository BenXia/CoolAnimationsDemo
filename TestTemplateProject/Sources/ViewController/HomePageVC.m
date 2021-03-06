//
//  HomePageVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "HomePageVC.h"
#import "PulsingCirclesVC.h"
#import "ImageEmitterVC.h"
#import "RewardSuccessVC.h"
#import "BoomVC.h"
#import "SliderVC.h"
#import "ScrollViewGalleryVC.h"
#import "CollectionViewGalleryVC.h"
#import "PlaygroundVC.h"

static const CGFloat kTableViewCellHeight = 60.0f;

@interface HomePageCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) Block didSelectCellHandleBlock;

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
                       vcClass:(Class)vcClass
                  navigationVC:(UINavigationController *)navigationVC;

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
      didSelectCellHandleBlock:(Block)didSelectCellHandleBlock;

@end

@implementation HomePageCellModel

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
                       vcClass:(Class)vcClass
                  navigationVC:(UINavigationController *)navigationVC {
    
    return [HomePageCellModel modelWithTitle:title
                                    subTitle:subTitle
                    didSelectCellHandleBlock:^{
                        UIViewController *vc = [[vcClass alloc] init];
                        [navigationVC pushViewController:vc animated:YES];
                    }];
}


+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
      didSelectCellHandleBlock:(Block)didSelectCellHandleBlock {
    HomePageCellModel *model = [HomePageCellModel new];
    model.title = title;
    model.subTitle = subTitle;
    model.didSelectCellHandleBlock = didSelectCellHandleBlock;
    
    return model;
}

@end

@interface HomePageVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <HomePageCellModel *> *dataSourceArray;

@end

@implementation HomePageVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    HomePageCellModel *model1 = [HomePageCellModel modelWithTitle:@"脉冲波浪"
                                                         subTitle:@"一个类似于支付宝中咻咻咻的脉冲波浪动画效果"
                                                          vcClass:[PulsingCirclesVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model2 = [HomePageCellModel modelWithTitle:@"粒子动画"
                                                         subTitle:@"图片的所有像素点合成图片的动画效果"
                                                          vcClass:[ImageEmitterVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model3 = [HomePageCellModel modelWithTitle:@"散花效果"
                                                         subTitle:@"使用 CAEmitterLayer 实现"
                                                          vcClass:[RewardSuccessVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model4 = [HomePageCellModel modelWithTitle:@"爆炸效果"
                                                         subTitle:@"一个 UIView 的扩展实现视图爆炸"
                                                          vcClass:[BoomVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model5 = [HomePageCellModel modelWithTitle:@"幻灯片"
                                                         subTitle:@"支持各种动画效果"
                                                          vcClass:[SliderVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model6 = [HomePageCellModel modelWithTitle:@"滑动卡片"
                                                         subTitle:@"基于 UIScrollView 的实现"
                                                          vcClass:[ScrollViewGalleryVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model7 = [HomePageCellModel modelWithTitle:@"滑动卡片"
                                                         subTitle:@"基于 UICollectionView 的实现"
                                                          vcClass:[CollectionViewGalleryVC class]
                                                     navigationVC:self.navigationController];
    
    self.dataSourceArray = [NSArray arrayWithObjects:model1, model2, model3, model4, model5, model6, model7, nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"炫酷动画";
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellReuseIdentifier = @"HomePageCellReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellReuseIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    cell.textLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].title;
    cell.detailTextLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].subTitle;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Block clickHandleBlock = [self.dataSourceArray objectAtIndex:indexPath.row].didSelectCellHandleBlock;
    if (clickHandleBlock) {
        clickHandleBlock();
    }
}


@end
