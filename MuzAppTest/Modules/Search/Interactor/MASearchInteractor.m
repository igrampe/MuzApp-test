//
//  MASearchInteractor.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchInteractor.h"

#import "MASearchInteractorOutput.h"

#import "MAApiManager.h"
#import "MADatamanager.h"

@interface MASearchInteractor ()

@property (nonatomic, strong) NSURLSessionTask *searchTask;

@end

@implementation MASearchInteractor

#pragma mark - MASearchInteractorInput

- (void)apiSearchWithQuery:(NSString *)query offset:(NSInteger)offset
{
    if (self.searchTask)
    {
        [self.searchTask cancel];
    }
    __weak typeof(self) welf = self;
    self.searchTask = [self.apiManager searchTrackWithQuery:query
                                                     offset:offset
                                                    handler:
    ^(NSArray *objects, NSError *error)
    {
        if (error)
        {
            [welf.output didFailedApiSearchWithError:error];
        } else
        {
            [welf.output didFinishApiSearchWithObjects:objects];
        }
    }];
}

- (void)dbAddHistoryItem:(MAHistoryItemPonso *)item
{
    [self.dataManager addHistoryItem:item];
}

- (void)dbAddTracks:(NSArray <MATrackPonso *>*)tracks
{
    [self.dataManager addTracks:tracks];
}

- (void)dbDeleteTracks
{
    [self.dataManager deleteTracks];
}

- (NSArray <MATrackPonso *>*)dbTracks
{
    return [self.dataManager tracks];
}

@end
