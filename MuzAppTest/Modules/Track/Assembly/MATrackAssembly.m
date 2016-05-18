//
//  MATrackAssembly.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackAssembly.h"

#import "MATrackViewController.h"
#import "MATrackPresenter.h"
#import "MATrackInteractor.h"
#import "MATrackRouter.h"

@implementation MATrackAssembly

- (MATrackPresenter *)presenter
{
    return [self presenterTrack];
}

- (MATrackViewController *)viewTrack
{
    return [TyphoonDefinition withClass:[MATrackViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterTrack]];
        [definition injectProperty:@selector(moduleInput)
                              with:[self presenterTrack]];
    }];
}

- (MATrackInteractor *)interactorTrack
{
    return [TyphoonDefinition withClass:[MATrackInteractor class]
                          configuration:
    ^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterTrack]];
        [definition injectProperty:@selector(dataManager)
                              with:[self.serviceComponents dataManager]];
    }];
}

- (MATrackPresenter *)presenterTrack
{
    return [TyphoonDefinition withClass:[MATrackPresenter class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewTrack]];
        [definition injectProperty:@selector(interactor)
                              with:[self interactorTrack]];
        [definition injectProperty:@selector(router)
                              with:[self routerTrack]];
    }];
}

- (MATrackRouter *)routerTrack
{
    return [TyphoonDefinition withClass:[MATrackRouter class]
                          configuration:^(TyphoonDefinition *definition)
    {

    }];
}

@end
