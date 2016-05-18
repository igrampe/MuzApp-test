//
//  MATrackViewInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class MATrackPonso;

@protocol MATrackViewInput <NSObject>

- (void)configureWithTrack:(MATrackPonso *)track;

@end
