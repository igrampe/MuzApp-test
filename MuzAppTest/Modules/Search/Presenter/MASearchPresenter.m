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

@interface MASearchPresenter ()

@property (nonatomic, strong) NSArray *tracks;

@end

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
    MAHistoryItemPonso *item = [MAHistoryItemPonso objectWithQuery:query date:[NSDate date]];
    [self.interactor dbAddHistoryItem:item];
    
    [self.interactor apiSearchWithQuery:query offset:0];
    [self.view showLoader];
}

#pragma mark - MASearchInteractorOutput

- (void)didFinishApiSearchWithObjects:(NSArray *)objects
{
    [self.interactor dbDeleteTracks];
    [self.interactor dbAddTracks:objects];
    [self _reloadTracks];
    [self.view hideLoader];
    if (objects.count > 0)
    {
        [self.view updateWithSearchResults:self.tracks];
        [self.view scrollToTop];
    } else
    {
        [self.view showNoResults];
    }
}

- (void)didFailedApiSearchWithError:(NSError *)error
{
    [self.view hideLoader];
    [self.view showErrorWithMessage:error.localizedDescription];
}

#pragma makr - Private

- (void)_reloadTracks
{
    self.tracks = [self.interactor dbTracks];
}

@end
