//
//  MATrackPresenter.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackPresenter.h"

#import "MATrackViewInput.h"
#import "MATrackInteractorInput.h"
#import "MATrackRouterInput.h"

@class MATrackPonso;

@interface MATrackPresenter ()

@property (nonatomic, strong) MATrackPonso *track;

@end

@implementation MATrackPresenter

#pragma mark - MATrackModuleInput

@synthesize trackId;

#pragma mark - MATrackViewOutput

- (void)viewWillAppear
{
    [self _reloadTrack];
    [self.view configureWithTrack:self.track];
}

#pragma mark - MATrackInteractorOutput

#pragma mark - Private

- (void)_reloadTrack
{
    self.track = [self.interactor trackWithId:trackId];
}

@end
