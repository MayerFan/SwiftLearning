//
//  ViewController.m
//  MasonryWithOC
//
//  Created by 范名扬 on 16/7/25.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test2];
}

- (void)test2 {
    //蓝色控件
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    // 红色
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.right.mas_equalTo(redView.mas_left).offset(-50);
        make.bottom.mas_equalTo(self.view).offset(-50);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(blueView.mas_right).offset(50); //约束重复
        make.bottom.mas_equalTo(self.view).offset(-50);
        make.right.mas_equalTo(self.view).offset(-50);
        make.height.mas_equalTo(100);
    }];
}

- (void)test1 {
    //蓝色控件
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //尺寸限制 100*100
    //位置紧贴父控件右下角，间距20
    
    //添加约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.equalTo(@100);
        //        make.height.equalTo(@100);
        //        make.right.equalTo(self.view).offset(-20);
        //        make.bottom.equalTo(self.view).offset(-20);
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
    }];
}


@end
