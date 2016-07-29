//
//  RZYMenuViewController.h
//  RZYDrawer
//
//  Created by mac on 16/6/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RZYMenuViewController;

@protocol MenuControllerDelegate <NSObject>

- (void)menuController: (RZYMenuViewController *)controller didSelectItemAtIndex: (NSUInteger)Index;

@end

@interface RZYMenuViewController : UIViewController
/**遵守协议的对象*/
@property(weak,nonatomic) id <MenuControllerDelegate> delegate;
@end
