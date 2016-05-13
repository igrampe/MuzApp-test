//
//  UIViewController+APLKeyboardHandler.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "APLKeyboardHelper.h"

@protocol UIViewControllerKeyboardHandler <NSObject>

@property (nonatomic, assign) BOOL hasKeyboard;

@end

@interface UIViewController (APLKeyboardHandler) <UIViewControllerKeyboardHandler>

- (void)setupKeyboardHandler;
- (void)keyboardUpdate;

@end
