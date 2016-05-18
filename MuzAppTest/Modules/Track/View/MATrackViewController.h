//
//  MATrackViewController.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "APLModuleViewController.h"

#import "MATrackViewInput.h"
#import "UIViewController+TransitionHandler.h"

@protocol MATrackViewOutput;

@interface MATrackViewController : APLModuleViewController <MATrackViewInput>

@property (nonatomic, strong) id<MATrackViewOutput> output;

@end
