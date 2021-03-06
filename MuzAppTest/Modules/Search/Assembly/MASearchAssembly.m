//
//  MASearchAssembly.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchAssembly.h"

#import "MASearchViewController.h"
#import "MASearchPresenter.h"
#import "MASearchInteractor.h"
#import "MASearchRouter.h"

@interface MASearchAssembly ()

@end

@implementation MASearchAssembly

- (MASearchViewController *)viewSearch
{
    return [TyphoonDefinition withClass:[MASearchViewController class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterSearch]];
    }];
}

- (MASearchInteractor *)interactorSearch
{
    return [TyphoonDefinition withClass:[MASearchInteractor class]
                          configuration:
    ^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(output)
                              with:[self presenterSearch]];
        [definition injectProperty:@selector(apiManager)
                              with:[self.serviceComponents apiManager]];
        [definition injectProperty:@selector(dataManager)
                              with:[self.serviceComponents dataManager]];
    }];
}

- (MASearchPresenter *)presenterSearch
{
    return [TyphoonDefinition withClass:[MASearchPresenter class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(view)
                              with:[self viewSearch]];
        [definition injectProperty:@selector(interactor)
                              with:[self interactorSearch]];
        [definition injectProperty:@selector(router)
                              with:[self routerSearch]];
    }];
}

- (MASearchRouter *)routerSearch
{
    return [TyphoonDefinition withClass:[MASearchRouter class]
                          configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(transitionHandler)
                              with:[self viewSearch]];
        [definition injectProperty:@selector(presenter)
                              with:[self presenterSearch]];
    }];
}

@end
