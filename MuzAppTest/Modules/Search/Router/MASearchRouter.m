//
//  MASearchRouter.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchRouter.h"

#import "MAHistoryViewController.h"

@interface MASearchRouter ()

@property (nonatomic, strong) id<MARouterTransitionHandler> historyModuleTransitionHandler;

@end

@implementation MASearchRouter

#pragma mark - MASearchRouterInput

- (void)openHistoryModule
{
    
    if (!self.historyModuleTransitionHandler)
    {
        __weak typeof(self) welf = self;
        [self.transitionHandler openModuleUsingSegue:@"OpenHistory" transitionBlock:
         ^(id<MARouterTransitionHandler> sourceModuleTransitionHandler,
           id<MARouterTransitionHandler> destinationModuleTransitionHandler)
         {
             welf.historyModuleTransitionHandler = destinationModuleTransitionHandler;
         }];
    }
}

- (void)closeHistoryModule
{
    if (self.historyModuleTransitionHandler)
    {
        [self.historyModuleTransitionHandler closeModule];
        self.historyModuleTransitionHandler = nil;
    }
}

@end
