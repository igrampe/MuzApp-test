//
//  MATrackObject+Ponso.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 14/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MATrackObject+Ponso.h"

#import "MATrackPonso.h"

@implementation MATrackObject (Ponso)

- (void)fillWithPonso:(MATrackPonso *)ponso
{
    self.trackId = ponso.trackId;
    self.artistName = ponso.artistName;
    self.trackName = ponso.trackName;
    self.collectionName = ponso.collectionName;
    self.artworkUrl = ponso.artworkUrl;
}

- (MATrackPonso *)ponso
{
    MATrackPonso *ponso = [MATrackPonso new];
    
    ponso.trackId = self.trackId;
    ponso.artistName = self.artistName;
    ponso.trackName = self.trackName;
    ponso.collectionName = self.collectionName;
    ponso.artworkUrl = self.artworkUrl;
    
    return ponso;
}

@end
