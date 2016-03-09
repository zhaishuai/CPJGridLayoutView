//
//  CPJGridView.m
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/9/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import "CPJGridView.h"
#import "CPJLibMacros.h"

@interface CPJGridView ()

@property (nonatomic)UIImageView *imageView;
@property (nonatomic)UIButton    *deleteBtn;

@end

@implementation CPJGridView

CPJPROPERTY_INITIALIZER(UIImageView, imageView)
CPJPROPERTY_INITIALIZER(UIButton, deleteBtn)
CPJCREATE_VIEW_INITIALZER(initializer)

- (void)setDeleteBtnSize:(CGSize)deleteBtnSize{
    self.deleteBtn.frame = CGRectMake(0, 0, deleteBtnSize.width, deleteBtnSize.height);
    self.deleteBtn.center = CGPointMake(self.frame.size.width, 0);
}

- (void)initializer{
    self.deleteBtnSize = CGSizeMake(30, 30);
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.deleteBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.deleteBtn.center = CGPointMake(self.frame.size.width, 0);
    [self.deleteBtn setImage:[UIImage imageNamed:@"deleteImg"] forState:UIControlStateNormal];
    [self addSubview:self.imageView];
    [self addSubview:self.deleteBtn];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object ==self && [keyPath isEqualToString:@"frame"]){
        self.imageView.frame = self.bounds;
        self.deleteBtn.center = CGPointMake(self.frame.size.width, 0);
    }
    else{
        //  调用父类的方法
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"frame"];
}

@end
