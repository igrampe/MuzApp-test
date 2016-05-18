//
//  MASearchRouter.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchRouter.h"

#import "MAHistoryViewController.h"
#import "APLOpenModulePromise.h"

#import "MATrackModuleInput.h"

@interface MASearchRouter ()

@property (nonatomic, strong) id<APLRouterTransitionHandler> historyModuleTransitionHandler;

@end

@implementation MASearchRouter

#pragma mark - MASearchRouterInput

- (void)openHistoryModule
{
    
    if (!self.historyModuleTransitionHandler)
    {
        __weak typeof(self) welf = self;
        
        [[self.transitionHandler openModuleUsingSegue:@"OpenHistory"
                                  withTransitionBlock:
          ^(id<APLRouterTransitionHandler> sourceModuleTransitionHandler,
            id<APLRouterTransitionHandler> destinationModuleTransitionHandler)
        {
            welf.historyModuleTransitionHandler = destinationModuleTransitionHandler;
        }] linkUsingBlock:^id<APLModuleOutput>(id<APLModuleInput> moduleInput)
        {
            return welf.presenter;
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

- (void)openTrackModuleWithTrackId:(NSNumber *)trackId
{
    [[self.transitionHandler openModuleUsingSegue:@"OpenTrack"
                              withTransitionBlock:
      ^(id<APLRouterTransitionHandler> sourceModuleTransitionHandler,
        id<APLRouterTransitionHandler> destinationModuleTransitionHandler)
      {
          
      }] linkUsingBlock:^id<APLModuleOutput>(id<APLModuleInput> moduleInput)
     {
         if ([moduleInput conformsToProtocol:@protocol(MATrackModuleInput)])
         {
             [(id<MATrackModuleInput>)moduleInput setTrackId:trackId];
         }
         return nil;
     }];
}

@end
