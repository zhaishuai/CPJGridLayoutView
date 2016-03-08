//
//  ViewController.m
//  CPJGridLayoutView
//
//  Created by shuaizhai on 3/8/16.
//  Copyright © 2016 shuaizhai. All rights reserved.
//

#import "ViewController.h"
#import "CPJGridLayoutView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CPJGridLayoutView *gridView = [[CPJGridLayoutView alloc] initWithMarginX:10 withMarginY:15 withImageSize:CGSizeMake(50, 50)];
    CPJGridLayoutView *gridView = [[CPJGridLayoutView alloc] initWithMarginX:10 withMarginY:15 withQuantityOfEachRow:4];
    gridView.frame = CGRectMake(50, 100, 110, 400);
    gridView.backgroundColor = [UIColor yellowColor];
    for (int i = 0 ; i < 10 ; i++){
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        [gridView addView:view];
    }
    [gridView layoutView];
    [self.view addSubview:gridView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
