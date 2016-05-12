//
//  MAHistoryPresenter.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryViewOutput.h"
#import "MAHistoryInteractorOutput.h"
#import "MAHistoryModuleInput.h"
#import "MAHistoryModuleOutput.h"

@protocol MAHistoryViewInput;
@protocol MAHistoryInteractorInput;
@protocol MAHistoryRouterInput;

@interface MAHistoryPresenter : NSObject <MAHistoryModuleInput, MAHistoryViewOutput, MAHistoryInteractorOutput>

@property (nonatomic, weak) id<MAHistoryViewInput> view;
@property (nonatomic, strong) id<MAHistoryInteractorInput> interactor;
@property (nonatomic, strong) id<MAHistoryRouterInput> router;
@property (nonatomic, weak) id<MAHistoryModuleOutput> output;

@end
