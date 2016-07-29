//
//  RZYFirstViewController.m
//  RZYDrawer
//
//  Created by mac on 16/6/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RZYFirstViewController.h"
#import "RZYContainerViewController.h"

@implementation RZYFirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
   
    //   标题、背景颜色
     self.title = @"First";
     self.view.backgroundColor = [UIColor orangeColor];
    //   投影颜色、偏移显示、投影透明度、投影半径
     self.navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;
     self.navigationController.view.layer.shadowOffset = CGSizeMake(-10, 0);
     self.navigationController.view.layer.shadowOpacity = 0.15;
     self.navigationController.view.layer.shadowRadius = 10;
    //   菜单按钮的设置
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(openCloseMenu:)];
    self.navigationItem.leftBarButtonItem = menuItem;
}

/**侧边栏的展开和关闭*/
- (void)openCloseMenu: (UIBarButtonItem *)sender
{
    [self.navigationController.parentViewController performSelector:@selector(openCloseMenu)];
}

@end
