//
//  ViewController.m
//  DemoViewResponse
//
//  Created by wu yutian on 2018/11/7.
//  Copyright © 2018年 wu yutian. All rights reserved.
//

#import "ViewController.h"
#import "RectInsetView.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RectInsetView *view = [RectInsetView new];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
}


@end
