//
//  MAHistoryInteractor.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryInteractorInput.h"

@protocol MAHistoryInteractorOutput;
@protocol MADataManager;

@interface MAHistoryInteractor : NSObject <MAHistoryInteractorInput>

@property (nonatomic, weak) id<MAHistoryInteractorOutput> output;

@property (nonatomic, strong) id<MADataManager> dataManager;

@end
