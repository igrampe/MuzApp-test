//
//  MASearchResultCellObject.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MASearchResultCellObject.h"

#import "MATrackPonso.h"

@implementation MASearchResultCellObject

+ (MASearchResultCellObject *)objectWithTrack:(MATrackPonso *)track
{
    MASearchResultCellObject *object = [MASearchResultCellObject new];
    
//    object.imageUrlString = track.artworkUrl;
//    object.trackName = track.trackName;
//    object.artistName = track.artistName;
//    object.collectionName = track.collectionName;
    
    return object;
}

- (NSURL *)imageUrl
{
    NSURL *result = [NSURL URLWithString:self.imageUrlString];
    return result;
}

- (NSString *)artistTitle
{
    NSString *result = @"";
    if (self.artistName)
    {
        result = [result stringByAppendingFormat:@"%@", self.artistName];
    }
    if (self.collectionName)
    {
        if (result.length > 0)
        {
            result = [result stringByAppendingFormat:@" - "];
        }
        result = [result stringByAppendingFormat:@"%@", self.collectionName];
    }
    return result;
}

+ (MASearchResultCellObject *)mock
{
    MASearchResultCellObject *object = [MASearchResultCellObject new];
    object.imageUrlString = @"http://is4.mzstatic.com/image/thumb/Music1/v4/27/9b/5e/279b5e45-e590-c661-c198-3242a6f76f62/source/100x100bb.jpg";
    object.trackName = @"Can't Feel My Face";
    object.artistName = @"The Weeknd";
    object.collectionName = @"Beauty Behind the Madness";
    
    return object;
}

@end
