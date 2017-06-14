//
//  PulsingCirclesVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/14.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "PulsingCirclesVC.h"
#import "QQPulsingLayer.h"

static const CGFloat kButtonBgContentViewHeight = 150;
static const CGFloat kButtonHeight = 48;

@interface PulsingCirclesVC ()

@property (weak, nonatomic) IBOutlet UIButton *middelButton;

@property (nonatomic, strong) NSMutableArray *pulsingLayers;

@end

@implementation PulsingCirclesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.middelButton.layer.cornerRadius = kButtonHeight/2;
    self.middelButton.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 动画

- (IBAction)didClickMiddleButtonAction:(id)sender {
    if (self.pulsingLayers.count > 0) {
        [self stopAnimation];
    } else {
        [self startAnimation];
    }
}

- (NSMutableArray *)pulsingLayers {
    if (!_pulsingLayers) {
        _pulsingLayers = [NSMutableArray array];
    }
    return _pulsingLayers;
}

- (void)startAnimation {
    [self stopAnimation];
    self.middelButton.hidden = NO;
    // 脉冲的个数
    int cycleNum = 7;
    NSTimeInterval animationDuration = 3;
    for (int i = 0; i < cycleNum; i++) {
        //创建执行动画的Layer
        QQPulsingLayer *pulsingLayer = [QQPulsingLayer layer];
        pulsingLayer.radius = kButtonBgContentViewHeight/2;
        pulsingLayer.position = self.middelButton.center;
        pulsingLayer.animationDuration = animationDuration;
        pulsingLayer.pulseInterval = animationDuration*1.0/cycleNum;
        pulsingLayer.layerIndex = i+1;
        pulsingLayer.backgroundColor = RGB(35, 205, 119).CGColor;
        [self.pulsingLayers addObject:pulsingLayer];
        [self.view.layer addSublayer:pulsingLayer];
        [self.view.layer insertSublayer:pulsingLayer below:self.middelButton.layer];
    }
}

- (void)stopAnimation {
    self.middelButton.hidden = YES;
    for (QQPulsingLayer *layer in self.pulsingLayers) {
        [layer removeFromSuperlayer];
    }
}

@end
