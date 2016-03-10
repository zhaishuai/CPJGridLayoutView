//
//  ViewController.m
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import "ViewController.h"
#import "CPJGridLayoutView.h"
#import "CPJGridLayoutView/CPJGridView.h"

@interface ViewController ()<CPJGridViewDelegate>

@property (nonatomic)CPJGridLayoutView *gridView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CPJGridLayoutView *gridView = [[CPJGridLayoutView alloc] initWithMarginX:10 withMarginY:15 withImageSize:CGSizeMake(50, 50)];
    CPJGridLayoutView *gridView = [[CPJGridLayoutView alloc] initWithMarginX:10 withMarginY:15 withQuantityOfEachRow:4];

    self.gridView = gridView;
    gridView.frame = CGRectMake(10, 100, 300, 400);
    gridView.backgroundColor = [UIColor yellowColor];
    for (int i = 0 ; i < 20 ; i++){
        CPJGridView *view = [[CPJGridView alloc] init];
        view.backgroundColor = [UIColor greenColor];
        [gridView addSubview:view];
        view.delegate = self;
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%d", i];
        label.textColor = [UIColor blackColor];
        [label sizeToFit];
        [view addSubview:label];
    }
    [gridView layoutView];
    [self.gridView sizeToFit];
    [self.view addSubview:gridView];
    
//    [gridView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)]];
    
}

//- (void)panGestureAction:(UIPanGestureRecognizer *)sender{
//    
//    CGPoint point = [sender translationInView:self.view];
//    
//    self.gridView.frame = CGRectMake(self.gridView.frame.origin.x, self.gridView.frame.origin.y, self.gridView.frame.size.width + point.x, self.gridView.frame.size.height + point.y);
//    [self.gridView layoutView];
//    [sender setTranslation:CGPointZero inView:self.view];
//
//}

- (void)deleteGridViewAction:(NSInteger)index{
    NSLog(@"index: %ld", index);
    [self.gridView sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
