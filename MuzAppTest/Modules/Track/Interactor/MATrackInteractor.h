//
//  MATrackInteractor.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackInteractorInput.h"

@protocol MATrackInteractorOutput;
@protocol MADataManager;

@interface MATrackInteractor : NSObject <MATrackInteractorInput>

@property (nonatomic, weak) id<MATrackInteractorOutput> output;

@property (nonatomic, strong) id<MADataManager> dataManager;

@end
