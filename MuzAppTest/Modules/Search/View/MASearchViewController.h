//
//  MASearchViewController.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "APLModuleViewController.h"
#import "MASearchViewInput.h"

@protocol MASearchViewOutput;

@interface MASearchViewController : APLModuleViewController <MASearchViewInput>

@property (nonatomic, strong) id<MASearchViewOutput> output;

@end
