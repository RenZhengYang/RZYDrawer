//
//  RZYContainerViewController.m
//  RZYDrawer
//
//  Created by mac on 16/6/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RZYContainerViewController.h"
#import "RZYMenuViewController.h"
#import "RZYFirstViewController.h"
#import "RZYSecondViewController.h"

@interface RZYContainerViewController ()<MenuControllerDelegate>

/**菜单控制器*/
@property(strong,nonatomic) RZYMenuViewController *menuViewController;
/**用来存放和记录当前呈现的主控制器界面*/
@property(strong,nonatomic)UIViewController *contentController;
/**记录容器控制器中，要管理多少个这样的界面*/
@property(strong,nonatomic)NSArray *viewControllers;
/**标记当前菜单是打开还是关闭状态*/
@property(assign,nonatomic,readonly)BOOL isMenuOpen;
/**记录视图控制器在数组中的位置*/
@property(assign,nonatomic) NSUInteger controllerIndex;
/**判断动画是否正在执行*/
@property(assign,nonatomic,readonly)BOOL isAnimating;
@end

@implementation RZYContainerViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addMenuViewController];
    [self addContentControllers];
    
}
/**封装菜单界面*/
- (void)addMenuViewController
{
    //  创建菜单控制器
    [self setMenuViewController:[[RZYMenuViewController alloc]init]];
    [self addChildViewController:self.menuViewController];
    [self.view addSubview:self.menuViewController.view];
    self.menuViewController.delegate = self;
}
/**添加子控制器对像*/
- (void)addContentControllers
{
  /*
    完成两个主控制视图的添加
   */
    RZYFirstViewController *firstController = [[RZYFirstViewController alloc]init];
    UINavigationController *navFirstController = [[UINavigationController alloc]initWithRootViewController:firstController];

    RZYSecondViewController *secondController = [[RZYSecondViewController alloc]init];
    UINavigationController *navSecondController = [[UINavigationController alloc]initWithRootViewController:secondController];

     [self setViewControllers:@[navFirstController,navSecondController]];
     [self setContentController:navFirstController];
}

/**完成控制器的添加和移除*/
-(void)setContentController:(UIViewController *)contentController
{
    if (_contentController == contentController){
        return;
    }
    
   //      内容控制器起始坐标不一致
    if (_contentController) {
        contentController.view.transform = _contentController.view.transform;
    }
    
    [_contentController willMoveToParentViewController:nil];
    [_contentController.view removeFromSuperview];  //   移除旧的视图
    [_contentController removeFromParentViewController]; //   解除父子控制器关系
    
    //  增添传进来的视图
    _contentController = contentController;
    [self addChildViewController:contentController];
    [self.view addSubview:contentController.view];
    
    
}

/**侧边按钮的动画*/
- (void)openCloseMenu
{

    if (_isAnimating) {
        return;
     }
   [UIView animateWithDuration:0.15 animations:^{
        _isAnimating = YES;
       if(!_isMenuOpen){
            self.contentController.view.transform = CGAffineTransformMakeTranslation(180, 0);
       }
       else {
           self.contentController.view.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(self.view.bounds), 0);
     }
   }completion:^(BOOL finished) {
       _isMenuOpen = !_isMenuOpen;
       [self setContentController:self.viewControllers[self.controllerIndex]];
        if (!_isMenuOpen ) {
           [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseOut  animations:^{
               self.contentController.view.transform = CGAffineTransformIdentity;
           } completion:^(BOOL finished) {
               _isAnimating = NO;
           }];
    }
        else {
            _isAnimating = NO;
        }
       
   }];


}
/**代理方法的实现*/
- (void)menuController: (RZYMenuViewController *)controller didSelectItemAtIndex: (NSUInteger)Index;
{
    [self setControllerIndex:Index];
    
    [self openCloseMenu];
    
}

@end
