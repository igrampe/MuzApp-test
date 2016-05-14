//
//  MADataManager.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MAHistoryItemPonso;
@class MATrackPonso;

@protocol MADataManager <NSObject>

- (void)addHistoryItem:(MAHistoryItemPonso *)ponso;
- (NSArray <MAHistoryItemPonso *> *)historyItems;

- (void)addTracks:(NSArray <MATrackPonso *>*)tracks;
- (void)deleteTracks;
- (NSArray <MATrackPonso *>*)tracks;
- (MATrackPonso *)trackWithId:(NSNumber *)trackId;

@end
