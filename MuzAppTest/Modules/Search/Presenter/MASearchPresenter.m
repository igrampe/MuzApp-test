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

#import "MAHistoryItemPonso.h"

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

- (void)actionSearchBarTextDidChange
{
    if ([self.view valueSearchBarText].length == 0)
    {
        [self.router openHistoryModule];
    } else
    {
        [self.router closeHistoryModule];
    }
}

- (void)actionSearchBarSearch
{
    NSString *query = [self.view valueSearchBarText];
    [self.interactor apiSearchWithQuery:query offset:0];
    
    MAHistoryItemPonso *item = [MAHistoryItemPonso objectWithQuery:query date:[NSDate date]];
    [self.interactor dbAddHistoryItem:item];
}

#pragma mark - MASearchInteractorOutput

- (void)didFinishApiSearchWithObjects:(NSArray *)objects
{
    [self.view updateWithSearchResults:objects];
}

- (void)didFailedApiSearchWithError:(NSError *)error
{
    
}

@end
