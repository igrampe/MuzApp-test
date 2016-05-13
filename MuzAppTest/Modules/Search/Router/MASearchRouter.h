//
//  MASearchRouter.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchRouterInput.h"
#import "MARouterTransitionHandler.h"

@protocol MARouterTransitionHandler;

@interface MASearchRouter : NSObject <MASearchRouterInput>

@property (nonatomic, weak) id<MARouterTransitionHandler> transitionHandler;

@end
