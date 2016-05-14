//
//  MASearchInteractorInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class MAHistoryItemPonso;
@class MATrackPonso;

@protocol MASearchInteractorInput <NSObject>

- (void)apiSearchWithQuery:(NSString *)query offset:(NSInteger)offset;
- (void)dbAddHistoryItem:(MAHistoryItemPonso *)item;

- (void)dbAddTracks:(NSArray <MATrackPonso *>*)tracks;
- (void)dbDeleteTracks;
- (NSArray <MATrackPonso *>*)dbTracks;

@end
