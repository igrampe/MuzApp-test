//
//  MASearchInteractor.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchInteractorInput.h"

@protocol MASearchInteractorOutput;
@protocol MAApiManager;

@interface MASearchInteractor : NSObject <MASearchInteractorInput>

@property (nonatomic, weak) id<MASearchInteractorOutput> output;
@property (nonatomic, strong) id<MAApiManager> apiManager;

@end
