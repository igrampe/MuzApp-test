//
//  MASearchResultCellObject.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MATrackPonso;

@interface MASearchResultCellObject : NSObject

@property (nonatomic, strong) NSString *imageUrlString;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *collectionName;

+ (MASearchResultCellObject *)objectWithTrack:(MATrackPonso *)track;

- (NSURL *)imageUrl;
- (NSString *)artistTitle;

+ (MASearchResultCellObject *)mock;

@end
