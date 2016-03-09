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

- (instancetype)init{
    if(self = [super init]){
        [self initializer];
    }
    return self;
}

- (void)setDeleteBtnSize:(CGSize)deleteBtnSize{
    self.deleteBtn.frame = CGRectMake(0, 0, deleteBtnSize.width, deleteBtnSize.height);
    self.deleteBtn.center = CGPointMake(self.frame.size.width, 0);
}

- (void)initializer{
    self.deleteBtn = [UIButton new];
    self.userInteractionEnabled = YES;
    self.deleteBtnSize = CGSizeMake(20, 20);
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.deleteBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.deleteBtn.center = CGPointMake(self.frame.size.width - self.deleteBtn.frame.size.width/2, self.deleteBtn.frame.size.height/2);
    [self.deleteBtn setImage:[UIImage imageNamed:@"deleteImg"] forState:UIControlStateNormal];
    [self.deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.imageView];
    [self addSubview:self.deleteBtn];

}

- (void)setDeleteButtonImage:(UIImage *)deleteButtonImage{
    _deleteButtonImage = deleteButtonImage;
    [self.deleteBtn setImage:deleteButtonImage forState:UIControlStateNormal];
}

- (void)deleteAction{
    if([self.delegate respondsToSelector:@selector(deleteGridViewAction:)]){
        [self.delegate deleteGridViewAction:self];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object ==self && [keyPath isEqualToString:@"frame"]){
        self.imageView.frame = self.bounds;
        self.deleteBtn.center = CGPointMake(self.frame.size.width - self.deleteBtn.frame.size.width/2, self.deleteBtn.frame.size.height/2);
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
