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

@implementation MASearchAssembly

- (MASearchPresenter *)presenter
{
    return [self presenterSearch];
}

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

    }];
}

@end
