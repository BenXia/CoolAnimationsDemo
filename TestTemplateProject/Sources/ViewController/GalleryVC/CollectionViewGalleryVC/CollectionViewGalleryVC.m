//
//  CollectionViewGalleryVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/8/1.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CollectionViewGalleryVC.h"
#import "MyMemberShipCell.h"
#import "MyMemberShipLayout.h"

@interface CollectionViewGalleryVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CollectionViewGalleryVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MyMemberShipLayout *flowLayout = [[MyMemberShipLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(kMyMemberShipItemWidth , kMyMemberShipItemHeight);
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.needAlpha = YES;
    flowLayout.delegate = self;
    
    CGFloat halfSpaceGap = (kScreenWidth - kMyMemberShipItemWidth) * 0.5;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, halfSpaceGap, 0, halfSpaceGap);

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.decelerationRate = 0.5;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyMemberShipCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([MyMemberShipCell class])];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyMemberShipCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MyMemberShipCell class]) forIndexPath:indexPath];
    
    return cell;
}

// 点击item的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [CommonUtils showToastWithText:[NSString stringWithFormat:@"点击了第%zd张", indexPath.row+1] withImageName:nil blockUI:NO];
}

#pragma CustomLayout的代理方法

- (void)collectioViewScrollToIndex:(NSInteger)index {
    [CommonUtils showToastWithText:[NSString stringWithFormat:@"滑到了第%zd张", index+1] withImageName:nil blockUI:NO];
}

@end


