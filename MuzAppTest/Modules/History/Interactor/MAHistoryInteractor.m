//
//  MAHistoryInteractor.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryInteractor.h"

#import "MAHistoryInteractorOutput.h"

#import "MADataManager.h"

@interface MAHistoryInteractor ()

@end

@implementation MAHistoryInteractor

#pragma mark - MAHistoryInteractorInput

- (NSArray *)dbHistoryItems
{
    return [self.dataManager historyItems];
}

@end
