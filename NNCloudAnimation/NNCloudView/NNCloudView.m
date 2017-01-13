//
//  NNCloudView.m
//  NNCloudAnimation
//
//  Created by 刘朋坤 on 17/1/13.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNCloudView.h"

#define RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:A]

@interface NNCloudView()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAShapeLayer *firstCloudLayer;
@property (nonatomic, strong) CAShapeLayer *secondCloudLayer;
@property (nonatomic, strong) CAShapeLayer *thirdCloudLayer;
@property (nonatomic, strong) CAShapeLayer *fourthCloudLayer;
@property (nonatomic, strong) CAShapeLayer *fifthCloudLayer;

@property (nonatomic, assign) CGFloat cloudAmplitude;
@property (nonatomic, assign) CGFloat cloudCycle;
@property (nonatomic, assign) CGFloat cloudSpeed;
@property (nonatomic, assign) CGFloat cloudWidth;
@property (nonatomic, assign) CGFloat cloudPointY;
@property (nonatomic, assign) CGFloat cloudOffsetX;
@property (nonatomic, strong) UIColor *cloudColor;

@end

@implementation NNCloudView

- (CAShapeLayer *)firstCloudLayer {
    if (!_firstCloudLayer) {
        _firstCloudLayer = [CAShapeLayer layer];
        _firstCloudLayer.fillColor = [self.cloudColor CGColor];
    }
    return _firstCloudLayer;
}

- (CAShapeLayer *)secondCloudLayer {
    if (!_secondCloudLayer) {
        _secondCloudLayer = [CAShapeLayer layer];
        _secondCloudLayer.fillColor = [self.cloudColor CGColor];
    }
    return _secondCloudLayer;
}

- (CAShapeLayer *)thirdCloudLayer {
    if (!_thirdCloudLayer) {
        _thirdCloudLayer = [CAShapeLayer layer];
        _thirdCloudLayer.fillColor = [self.cloudColor CGColor];
    }
    return _thirdCloudLayer;
}

- (CAShapeLayer *)fourthCloudLayer {
    if (!_fourthCloudLayer) {
        _fourthCloudLayer = [CAShapeLayer layer];
        _fourthCloudLayer.fillColor = [self.cloudColor CGColor];
    }
    return _fourthCloudLayer;
}

- (CAShapeLayer *)fifthCloudLayer {
    if (!_fifthCloudLayer) {
        _fifthCloudLayer = [CAShapeLayer layer];
        _fifthCloudLayer.fillColor = [self.cloudColor CGColor];
    }
    return _fifthCloudLayer;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(makeCloud)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

- (void)makeCloud {
    self.cloudOffsetX += self.cloudSpeed;
    
    [self cloudLayerName:self.firstCloudLayer];
    [self cloudLayerName:self.secondCloudLayer];
    [self cloudLayerName:self.thirdCloudLayer];
    [self cloudLayerName:self.fourthCloudLayer];
    [self cloudLayerName:self.fifthCloudLayer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(0, 114, 198, 1);
        self.layer.masksToBounds = YES;
        
        
        self.cloudWidth = self.frame.size.width;
        self.cloudColor = RGBA(255, 255, 255, 0.3);
        self.cloudSpeed = 0.05 / M_PI;
        self.cloudPointY = 100;
        self.cloudOffsetX = 0;
        self.cloudAmplitude = 30;
        self.cloudCycle =  1.03 * M_PI / self.cloudWidth;
        
        [self.layer addSublayer:self.firstCloudLayer];
        [self.layer addSublayer:self.secondCloudLayer];
        [self.layer addSublayer:self.thirdCloudLayer];
        [self.layer addSublayer:self.fourthCloudLayer];
        [self.layer addSublayer:self.fifthCloudLayer];
    }
    return self;
}

#pragma mark - CAShapeLayer 动画
- (void)cloudLayerName:(CAShapeLayer *)cloudLayerName {
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = self.cloudPointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= self.cloudWidth; x++) {
        if (cloudLayerName == self.firstCloudLayer) {
            y = self.cloudAmplitude * sin(self.cloudCycle * x + self.cloudOffsetX - 10) + self.cloudPointY + 10;
        } else if (cloudLayerName == self.secondCloudLayer) {
            y = (self.cloudAmplitude + 15) * sin(self.cloudCycle * x + self.cloudOffsetX ) + self.cloudPointY ;
        } else if (cloudLayerName == self.thirdCloudLayer) {
            y = (self.cloudAmplitude + 30)* sin(self.cloudCycle * x + self.cloudOffsetX + 20) + self.cloudPointY + 10;
        } else if (cloudLayerName == self.fourthCloudLayer) {
            y = (self.cloudAmplitude + 20)* sin(self.cloudCycle * x + self.cloudOffsetX - 20) + self.cloudPointY - 10;
        } else if (cloudLayerName == self.fifthCloudLayer) {
            y = (self.cloudAmplitude + 10)* sin(self.cloudCycle * x + self.cloudOffsetX - 10) + self.cloudPointY + 2;
        }
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, self.cloudWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    cloudLayerName.path = path;
    CGPathRelease(path);
}


@end
