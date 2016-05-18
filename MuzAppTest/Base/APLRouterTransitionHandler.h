//
//  MARouterTransitionHandler.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APLRouterTransitionHandler;
@protocol APLModuleInput;
@class APLOpenModulePromise;

typedef void (^APLModuleTransitionBlock)(id<APLRouterTransitionHandler> sourceModuleTransitionHandler,
                                         id<APLRouterTransitionHandler> destinationModuleTransitionHandler);

@protocol APLRouterTransitionHandler <NSObject>

- (APLOpenModulePromise *)openModuleUsingSegue:(NSString*)segueIdentifier withTransitionBlock:(APLModuleTransitionBlock)transitionBlock;
- (void)openModuleUsingSegue:(NSString *)segueIdentifier transitionBlock:(APLModuleTransitionBlock)transitionBlock;
- (void)closeModule;

@optional

- (void)vc_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@property (nonatomic, copy) APLModuleTransitionBlock transitionBlock;
@property (nonatomic, strong) id<APLModuleInput> moduleInput;

@end