//
//  MAHistoryModuleOutput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "APLModuleOutput.h"

@protocol MAHistoryModuleOutput <APLModuleOutput>

- (void)historyModuleDidSelectHistoryItemWithQuery:(NSString *)query;

@end
