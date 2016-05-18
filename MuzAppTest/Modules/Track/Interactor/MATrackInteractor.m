//
//  MATrackInteractor.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackInteractor.h"

#import "MATrackInteractorOutput.h"

#import "MADataManager.h"

@implementation MATrackInteractor

#pragma mark - MATrackInteractorInput

- (MATrackPonso *)trackWithId:(NSNumber *)trackId
{
    if (!trackId)
    {
        return nil;
    }
    return [self.dataManager trackWithId:trackId];
}

@end
