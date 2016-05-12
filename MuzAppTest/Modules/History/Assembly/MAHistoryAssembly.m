//
//  MAHistoryAssembly.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryAssembly.h"

#import "MAHistoryViewController.h"
#import "MAHistoryPresenter.h"
#import "MAHistoryInteractor.h"
#import "MAHistoryRouter.h"

@implementation MAHistoryAssembly

- (MAHistoryPresenter *)presenter
{
    return [self presenterHistory];
}

- (MAHistoryViewController *)viewHistory
{
    return [TyphoonDefinition withClass:[MAHistoryViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterHistory]];
    }];
}

- (MAHistoryInteractor *)interactorHistory
{
    return [TyphoonDefinition withClass:[MAHistoryInteractor class]
                          configuration:
    ^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterHistory]];
    }];
}

- (MAHistoryPresenter *)presenterHistory
{
    return [TyphoonDefinition withClass:[MAHistoryPresenter class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewHistory]];
        [definition injectProperty:@selector(interactor)
                              with:[self interactorHistory]];
        [definition injectProperty:@selector(router)
                              with:[self routerHistory]];
    }];
}

- (MAHistoryRouter *)routerHistory
{
    return [TyphoonDefinition withClass:[MAHistoryRouter class]
                          configuration:^(TyphoonDefinition *definition)
    {

    }];
}

@end
