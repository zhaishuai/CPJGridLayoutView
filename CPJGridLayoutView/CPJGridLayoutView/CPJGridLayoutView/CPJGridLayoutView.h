//
//  CPJGridLayoutView.h
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPJLibMacros.h"

@interface CPJGridLayoutView : UIView

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withImageSize:(CGSize)size;

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withQuantityOfEachRow:(NSInteger) quantity;

- (void)layoutView;

- (void)addView:(UIView *)view;

- (void)addView:(UIView *)view withIndex:(NSInteger)index;

- (void)addView:(UIView *)view afterView:(UIView *)obj;

- (void)removeAllView;

- (void)removeViewWithIndex:(NSInteger)index;

- (void)removeView:(UIView *)view;

@end
