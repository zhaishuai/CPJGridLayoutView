//
//  CPJGridLayoutView.h
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CPJGridLayoutView : UIView

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withImageSize:(CGSize)size;

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withQuantityOfEachRow:(NSInteger) quantity;

/**
 * @brief 调用该方法实现布局
 */
- (void)layoutView;

/**
 * @brief 根据添加视图的序号计算出该视图左上角的坐标
 */
- (CGPoint)getPointWithIndex:(NSInteger)index;

- (NSInteger)getIndexOfView:(UIView *)view;

@end
