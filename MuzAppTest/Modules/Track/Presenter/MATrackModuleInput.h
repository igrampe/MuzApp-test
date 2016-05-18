//
//  MATrackModuleInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "APLModuleInput.h"

@protocol MATrackModuleInput <APLModuleInput>

@property (nonatomic, strong) NSNumber *trackId;

@end
