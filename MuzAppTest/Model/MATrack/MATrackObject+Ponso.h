//
//  MATrackObject+Ponso.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 14/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MATrackObject.h"

@class MATrackPonso;

@interface MATrackObject (Ponso)

- (void)fillWithPonso:(MATrackPonso *)ponso;
- (MATrackPonso *)ponso;

@end
