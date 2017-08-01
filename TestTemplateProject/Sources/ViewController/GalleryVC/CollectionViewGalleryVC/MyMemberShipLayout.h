//
//  MyMemberShipLayout.h
//  TestTemplateProject
//
//  Created by Ben on 2017/8/1.
//  Copyright © 2017年 iOSStudio. All rights reserved.
///

#import <UIKit/UIKit.h>

UIKIT_EXTERN const CGFloat kMyMemberShipItemHeight; 
UIKIT_EXTERN const CGFloat kMyMemberShipItemWidth;

@protocol UICollectionViewFlowLayoutDelegate <NSObject>

- (void)collectioViewScrollToIndex:(NSInteger)index;

@end

@interface MyMemberShipLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<UICollectionViewFlowLayoutDelegate>delegate;

@property (nonatomic, assign) BOOL needAlpha;

@end


