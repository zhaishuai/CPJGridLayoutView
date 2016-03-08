//
//  CPJGridLayoutView.m
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import "CPJGridLayoutView.h"

@interface CPJGridLayoutView ()

// 在此存放所有的子视图
//
@property (nonatomic)NSMutableArray *viewArray;

@end

@implementation CPJGridLayoutView



- (NSMutableArray *)viewArray{
    if(!_viewArray){
        _viewArray = [NSMutableArray new];
    }
    return _viewArray;
}

@end
