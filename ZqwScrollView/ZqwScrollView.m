//
//  ZqwScrollView.m
//  ZqwScrollView
//
//  Created by 朱泉伟 on 15/8/18.
//  Copyright (c) 2015年 ZhuQuanWei. All rights reserved.
//

#import "ZqwScrollView.h"

@interface ZqwScrollView(){}

@property (nonatomic, assign) CGPoint startOffset;

@end

@implementation ZqwScrollView

#pragma mark -
#pragma mark init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
// 进行一些基本属性设置
- (void)commonInit{
    self.scrollHorizontal = YES;
    self.scrollVertical = YES;
    self.contentSize = CGSizeZero;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self addGestureRecognizer:panGestureRecognizer];
}

#pragma mark -
#pragma mark getter and setter

- (void)setContentOffset:(CGPoint)offset{
    CGRect bounds = [self bounds];
    bounds.origin = offset;
    [self setBounds:bounds];
}

- (CGPoint)contentOffset{
    return self.bounds.origin;
}

#pragma mark -
#pragma mark GestureRecognizer

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            self.startOffset = self.contentOffset;
        }
            
        case UIGestureRecognizerStateChanged:{
            CGPoint translation = [panGestureRecognizer translationInView:self];
            CGPoint point = self.startOffset;
            
            if (!self.scrollHorizontal) {
                translation.x = 0.0;
            }
            if (!self.scrollVertical) {
                translation.y = 0.0;
            }
            
            CGFloat newBoundsOriginX = point.x - translation.x;
            CGFloat minBoundsOriginX = 0.0;
            CGFloat maxBoundsOriginX = self.contentSize.width - self.bounds.size.width;
            if (newBoundsOriginX > maxBoundsOriginX) {
                newBoundsOriginX = maxBoundsOriginX;
            }
            if (newBoundsOriginX < minBoundsOriginX) {
                newBoundsOriginX = minBoundsOriginX;
            }
            point.x = newBoundsOriginX ;
            
            CGFloat newBoundsOriginY = point.y - translation.y;
            
            CGFloat minBoundsOriginY = 0.0;
            CGFloat maxBoundsOriginY = self.contentSize.height - self.bounds.size.height;
            if (newBoundsOriginY > maxBoundsOriginY) {
                newBoundsOriginY = maxBoundsOriginY;
            }
            if (newBoundsOriginY < minBoundsOriginY) {
                newBoundsOriginY = minBoundsOriginY;
            }
            point.y = newBoundsOriginY;
            
            self.contentOffset = point;
        }
            break;
        case UIGestureRecognizerStateEnded:{
        }
            break;
        default:
            break;
    }
}

@end
