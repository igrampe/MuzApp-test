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

#import "MAHistoryModuleOutput.h"

#import "MAHistoryItemPonso.h"
#import "MATrackPonso.h"

@interface MASearchPresenter () <MAHistoryModuleOutput>

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
    [self.router openHistoryModule];
    [self.view setCancelButtonHidden:NO];
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
    [self.router closeHistoryModule];
    [self _perfromSearch];
}

- (void)actionDidSelectItemAtIndex:(NSInteger)index
{
    if (index < self.tracks.count)
    {
        MATrackPonso *track = self.tracks[index];
        [self.router openTrackModuleWithTrackId:track.trackId];
    }
}

- (void)actionCancel
{
    [self.router closeHistoryModule];
    [self.view hideKeyboard];
    [self.view setCancelButtonHidden:YES];
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

#pragma mark - MAHistoryModuleOutput

- (void)historyModuleDidSelectHistoryItemWithQuery:(NSString *)query
{
    [self.router closeHistoryModule];
    [self.view setSearchBarText:query];
    [self _perfromSearch];
}

#pragma makr - Private

- (void)_reloadTracks
{
    self.tracks = [self.interactor dbTracks];
}

- (void)_perfromSearch
{
    NSString *query = [self.view valueSearchBarText];
    MAHistoryItemPonso *item = [MAHistoryItemPonso objectWithQuery:query date:[NSDate date]];
    [self.interactor dbAddHistoryItem:item];
    
    [self.view setCancelButtonHidden:YES];
    [self.view hideKeyboard];
    [self.view showLoader];
    [self.interactor apiSearchWithQuery:query offset:0];
}

@end
