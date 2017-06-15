//
//  UIView+BNBoom.h
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BNBoom)

@property (nonatomic, strong) NSMutableArray <CALayer *> *boomCells;
@property (nonatomic, strong) UIImage *scaleSnapshot;

- (void)boom;
- (void)reset;

@end

@interface UIImage (BNBoom)

- (UIImage *)scaleImageToSize:(CGSize)size;

@end


