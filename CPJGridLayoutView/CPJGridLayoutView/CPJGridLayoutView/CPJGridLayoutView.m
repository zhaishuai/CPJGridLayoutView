//
//  CPJGridLayoutView.m
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import "CPJGridLayoutView.h"

@interface CPJGridLayoutView ()

enum CPJGridLayout {
    CPJGRID_TYPE_SIZE,
    CPJGRID_TYPE_QUANTITY
};

// 在此存放所有的子视图
//
@property (nonatomic)NSMutableArray *viewArray;

@property (nonatomic, assign)CGFloat            marginX;
@property (nonatomic, assign)CGFloat            marginY;
@property (nonatomic, assign)CGSize             subViewsize;
@property (nonatomic, assign)NSInteger          quantity;
@property (nonatomic, assign)enum CPJGridLayout type;

@end

@implementation CPJGridLayoutView

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withImageSize:(CGSize)size{
    if(self = [super init]){
        self.type = CPJGRID_TYPE_SIZE;
        self.marginX = mx;
        self.marginY = my;
        self.subViewsize    = size;
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (instancetype)initWithMarginX:(CGFloat)mx withMarginY:(CGFloat)my withQuantityOfEachRow:(NSInteger) quantity{
    if(self = [super init]){
        self.type = CPJGRID_TYPE_QUANTITY;
        self.marginX  = mx;
        self.marginY  = my;
        self.quantity = quantity;
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)layoutView{
//    if(self.type == CPJGRID_TYPE_SIZE){
//        NSInteger count = (self.quantity < self.viewArray.count ? self.quantity : self.viewArray.count);
        NSInteger count = self.viewArray.count;
        for(int i = 0 ; i < count ; i++){
            UIView *view = self.viewArray[i];
            CGPoint point = [self getSizeTypePointWithIndex:i];
            view.frame = CGRectMake(point.x, point.y, self.subViewsize.width, self.subViewsize.height);
        }
        
//    }else if(self.type == CPJGRID_TYPE_QUANTITY){
//        
//    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self && [keyPath isEqualToString:@"frame"]){
        if(self.type == CPJGRID_TYPE_SIZE){
            self.quantity = (self.frame.size.width + self.marginX) / (self.subViewsize.width + self.marginX);
        }else if(self.type == CPJGRID_TYPE_QUANTITY){
            CGFloat width = (self.frame.size.width + self.marginX) / self.quantity;
            width = width - self.marginX;
            self.subViewsize = CGSizeMake(width, width);
        };
    }
    else{
        //  调用父类的方法
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (CGPoint)getSizeTypePointWithIndex:(NSInteger)index{
    
    NSInteger row = 0, col = 0; // 行列
    col = index % self.quantity;
    row = index / self.quantity;
    
    return CGPointMake(col * (self.subViewsize.width + self.marginX), row * (self.marginY + self.subViewsize.height));
}

CPJPROPERTY_INITIALIZER(NSMutableArray, viewArray)

- (void)addView:(UIView *)view{
    [self addSubview:view];
    [self.viewArray addObject:view];
}

- (void)addView:(UIView *)view withIndex:(NSInteger)index{
    [self addSubview:view];
    [self.viewArray insertObject:view atIndex:index];
}

- (void)addView:(UIView *)view afterView:(UIView *)obj{
    [self addSubview:view];
    [self.viewArray insertObject:view atIndex:[self.viewArray indexOfObject:obj]];
}

- (void)removeAllView{
    [self.viewArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.viewArray removeAllObjects];
}

- (void)removeViewWithIndex:(NSInteger)index{
    [[self.viewArray objectAtIndex:index] removeFromSuperview];
    [self.viewArray removeObjectAtIndex:index];
}

- (void)removeView:(UIView *)view{
    [view removeFromSuperview];
    [self.viewArray removeObject:view];
}

@end
