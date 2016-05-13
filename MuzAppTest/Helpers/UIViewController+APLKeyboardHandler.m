//
//  UIViewController+APLKeyboardHandler.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "UIViewController+APLKeyboardHandler.h"

@implementation UIViewController (APLKeyboardHandler)

@dynamic hasKeyboard;

- (void)setupKeyboardHandler
{
    __weak typeof(self) welf = self;
    [self handleKeyboardWillShow:^(CGSize keyboardSize, double duration)
     {
         welf.hasKeyboard = YES;
         [welf _correctInsetsForKeyboardHeight:keyboardSize.height];
         
     }];
    [self handleKeyboardWillHide:^(CGSize keyboardSize, double duration)
     {
         welf.hasKeyboard = NO;
         [welf _correctInsetsForKeyboardHeight:keyboardSize.height];
     }];
    [self handleKeyboardWillChange:^(CGSize keyboardSize, double duration)
     {
         [welf _correctInsetsForKeyboardHeight:keyboardSize.height];
     }];
}

- (void)_correctInsetsForKeyboardHeight:(CGFloat)keyboardHeight
{
    if ([self respondsToSelector:@selector(hasKeyboard)])
    {
        CGFloat offset = self.hasKeyboard?keyboardHeight:0;
        if ([self respondsToSelector:@selector(tableView)])
        {
            UITableView *tableView = [self valueForKey:NSStringFromSelector(@selector(tableView))];
            tableView.contentInset = UIEdgeInsetsMake(0, 0, offset, 0);
            tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, offset, 0);
        }
    }
}

- (void)keyboardUpdate
{
    if ([self respondsToSelector:@selector(setHasKeyboard:)])
    {
        self.hasKeyboard = [APLKeyboardHelper helper].hasKeyboard;
    }
    [self _correctInsetsForKeyboardHeight:[APLKeyboardHelper helper].keyboardSize.height];
}

@end
