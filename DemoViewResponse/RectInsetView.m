//
//  RectInsetView.m
//  SmartHome
//
//  Created by wu yutian on 2018/11/6.
//  Copyright © 2018年 wu yutian. All rights reserved.
//

#import "RectInsetView.h"
#import "Masonry.h"

@interface RectInsetView()

@property(nonatomic, strong)UIButton *actionButton;
@property(nonatomic, assign)CGRect actionRect;

@end
@implementation RectInsetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithInsetView {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self addContentView];
    }
    return self;
}

- (void)addContentView {
    
}

- (UIButton *)actionButton {
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionButton setBackgroundColor:[UIColor redColor]];
        [_actionButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}

- (void)clickAction:(id)sender {
    NSLog(@"\\\\\response");
    NSLog(@"%s",__FUNCTION__);
}

- (void)setupUI {
    [self addSubview:self.actionButton];
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    self.actionRect = CGRectMake(self.actionButton.frame.origin.x - 20, self.actionButton.frame.origin.y - 20, CGRectGetWidth(self.actionButton.frame)+ 20, CGRectGetHeight(self.actionButton.frame) + 20);
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect newRect = CGRectInset(self.actionButton.frame, -20, -20);
    if (CGRectContainsPoint(newRect, point) && !self.actionButton.hidden && self.actionButton.alpha > 0.01) {
        return self.actionButton;
    }
    return [super hitTest:point withEvent:event];
}

@end
