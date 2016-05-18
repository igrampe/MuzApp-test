//
//  MAHistoryViewController.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "APLModuleViewController.h"

#import "MAHistoryViewInput.h"
#import "UIViewController+TransitionHandler.h"

@protocol MAHistoryViewOutput;

@interface MAHistoryViewController : APLModuleViewController <MAHistoryViewInput>

@property (nonatomic, strong) id<MAHistoryViewOutput> output;

@end
