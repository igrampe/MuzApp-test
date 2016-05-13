//
//  UIViewController+TransitionHandler.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "UIViewController+TransitionHandler.h"
#import <objc/runtime.h>

@implementation UIViewController (TransitionHandler)

@dynamic transitionBlock;

+ (void)initialize
{
    [self swizzlePrepareForSegue];
}

- (void)openModuleUsingSegue:(NSString *)segueIdentifier transitionBlock:(ModuleTransitionBlock)transitionBlock
{
    if ([self respondsToSelector:@selector(setTransitionBlock:)])
    {
        self.transitionBlock = transitionBlock;
    }
    dispatch_async(dispatch_get_main_queue(),^
    {
        [self performSegueWithIdentifier:segueIdentifier sender:nil];
    });
}

- (void)closeModule
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

#pragma mark - PrepareForSegue swizzling

+ (void)swizzlePrepareForSegue
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^
    {
        Class class = [self class];
        
        SEL originalSelector = @selector(prepareForSegue:sender:);
        SEL swizzledSelector = @selector(viper_prepareForSegue:sender:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod)
        {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else
        {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)viper_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self vc_prepareForSegue:segue sender:sender];
    if ([self respondsToSelector:@selector(transitionBlock)])
    {
        if (self.transitionBlock)
        {
            self.transitionBlock(segue.sourceViewController, segue.destinationViewController);
        }
    }
}

- (void)vc_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
