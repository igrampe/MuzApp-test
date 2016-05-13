//
//  MAHistoryViewController.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MAModuleViewController.h"

#import "MAHistoryViewInput.h"

@protocol MAHistoryViewOutput;

@interface MAHistoryViewController : MAModuleViewController <MAHistoryViewInput>

@property (nonatomic, strong) id<MAHistoryViewOutput> output;

@end
