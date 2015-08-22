//
//  ZqwScrollView.h
//  ZqwScrollView
//
//  Created by 朱泉伟 on 15/8/18.
//  Copyright (c) 2015年 ZhuQuanWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZqwScrollView : UIView

@property (nonatomic) CGPoint contentOffset;
@property (nonatomic) CGSize contentSize;
@property (nonatomic) BOOL scrollVertical;
@property (nonatomic) BOOL scrollHorizontal;

@end
