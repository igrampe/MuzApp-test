//
//  MARouterTransitionHandler.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MARouterTransitionHandler;

typedef void (^ModuleTransitionBlock)(id<MARouterTransitionHandler> sourceModuleTransitionHandler,
                                      id<MARouterTransitionHandler> destinationModuleTransitionHandler);

@protocol MARouterTransitionHandler <NSObject>

- (void)openModuleUsingSegue:(NSString *)segueIdentifier transitionBlock:(ModuleTransitionBlock)transitionBlock;
- (void)closeModule;

@optional

- (void)vc_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@property (nonatomic, copy) ModuleTransitionBlock transitionBlock;

@end