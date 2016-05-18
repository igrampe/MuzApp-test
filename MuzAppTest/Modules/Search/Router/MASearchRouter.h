//
//  MASearchRouter.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchRouterInput.h"
#import "APLRouterTransitionHandler.h"

@protocol APLRouterTransitionHandler;
@protocol APLModuleOutput;

@interface MASearchRouter : NSObject <MASearchRouterInput>

@property (nonatomic, weak) id<APLRouterTransitionHandler> transitionHandler;
@property (nonatomic, strong) id<APLModuleOutput> presenter;

@end
