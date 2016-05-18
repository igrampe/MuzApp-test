//
//  MASearchPresenter.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchViewOutput.h"
#import "MASearchInteractorOutput.h"
#import "MASearchModuleInput.h"
#import "MASearchModuleOutput.h"

@protocol MASearchViewInput;
@protocol MASearchInteractorInput;
@protocol MASearchRouterInput;

@interface MASearchPresenter : NSObject
<MASearchModuleInput, MASearchViewOutput, MASearchInteractorOutput>

@property (nonatomic, weak) id<MASearchViewInput> view;
@property (nonatomic, strong) id<MASearchInteractorInput> interactor;
@property (nonatomic, strong) id<MASearchRouterInput> router;
@property (nonatomic, weak) id<MASearchModuleOutput> output;

@end
