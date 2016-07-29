//
//  RZYMenuViewController.m
//  RZYDrawer
//
//  Created by mac on 16/6/9.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "RZYMenuViewController.h"
@interface RZYMenuViewController()


@end
@implementation RZYMenuViewController

-(void)viewDidLoad
{
     [super viewDidLoad];
    // 背景颜色
     [self.view setBackgroundColor:[UIColor darkGrayColor]];
    // 增加item
    [self addMenuItems];
}
/**向菜单中增加item*/
- (void)addMenuItems
{
    //  item1的设置
    UIButton *item1 = [UIButton buttonWithType:UIButtonTypeCustom];
    item1.frame = CGRectMake(0, 100, 180, 40);
    item1.backgroundColor = [UIColor orangeColor];
    [item1 setTitle:@"item1" forState:UIControlStateNormal];
    item1.titleLabel.font = [UIFont systemFontOfSize:20];
    item1.tag = 1;
    [self.view addSubview:item1];
    
    //  item2的设置
    UIButton *item2 = [UIButton buttonWithType:UIButtonTypeCustom];
    item2.frame = CGRectMake(0, 140, 180, 40);
    item2.backgroundColor = [UIColor blackColor];
    [item2 setTitle:@"item2" forState:UIControlStateNormal];
    item2.titleLabel.font = [UIFont systemFontOfSize:20];
    item2.tag = 2;
    [self.view addSubview:item2];
    
    //  添加点击事件
    [item1 addTarget:self action:@selector(menuItemSelected:) forControlEvents:  UIControlEventTouchUpInside ];
    [item2 addTarget:self action:@selector(menuItemSelected:) forControlEvents:  UIControlEventTouchUpInside ];
}

/**选中菜单*/
- (void)menuItemSelected: (UIButton *)sender
{
    //  判断是否响应这个代理方法
    if ([self.delegate respondsToSelector:@selector(menuController:didSelectItemAtIndex:)]) {
        [self.delegate menuController:self didSelectItemAtIndex:sender.tag - 1];

    }
    
}






@end
