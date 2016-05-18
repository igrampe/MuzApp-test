//
//  MATrackPresenter.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackViewOutput.h"
#import "MATrackInteractorOutput.h"
#import "MATrackModuleInput.h"
#import "MATrackModuleOutput.h"

@protocol MATrackViewInput;
@protocol MATrackInteractorInput;
@protocol MATrackRouterInput;

@interface MATrackPresenter : NSObject <MATrackModuleInput, MATrackViewOutput, MATrackInteractorOutput>

@property (nonatomic, weak) id<MATrackViewInput> view;
@property (nonatomic, strong) id<MATrackInteractorInput> interactor;
@property (nonatomic, strong) id<MATrackRouterInput> router;
@property (nonatomic, weak) id<MATrackModuleOutput> output;

@end
