//
//  MASearchPresenter.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchPresenter.h"

#import "MASearchViewInput.h"
#import "MASearchInteractorInput.h"
#import "MASearchRouterInput.h"

@implementation MASearchPresenter

#pragma mark - MASearchModuleInput

#pragma mark - MASearchViewOutput

- (void)viewWillAppear
{
    
}

- (void)actionSearchBarActivate
{
    if ([self.view valueSearchBarText].length == 0)
    {
        [self.router openHistoryModule];
    }
}

#pragma mark - MASearchInteractorOutput

@end
