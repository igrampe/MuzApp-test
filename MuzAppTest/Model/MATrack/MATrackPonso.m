//
//  MATrackPonso.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MATrackPonso.h"

@implementation MATrackPonso

+ (EKObjectMapping *)objectMapping
{
    EKObjectMapping *mapping = [EKObjectMapping mappingForClass:[self class]
                                                      withBlock:
    ^(EKObjectMapping *mapping)
    {
        [mapping mapPropertiesFromArray:@[NSStringFromSelector(@selector(trackId)),
                                          NSStringFromSelector(@selector(artistName)),
                                          NSStringFromSelector(@selector(trackName)),
                                          NSStringFromSelector(@selector(collectionName))]];
        
        [mapping mapKeyPath:@"artworkUrl100"
                 toProperty:NSStringFromSelector(@selector(artworkUrl))];
        [mapping mapKeyPath:@"primaryGenreName"
                 toProperty:NSStringFromSelector(@selector(genreName))];
        [mapping mapKeyPath:@"releaseDate"
                 toProperty:NSStringFromSelector(@selector(year))
             withValueBlock:^id(NSString *key, id value)
        {
            NSNumber *result = nil;
            
            if ([value isKindOfClass:[NSString class]])
            {
                if (((NSString *)value).length >= 4)
                {
                    NSString *ys = [value substringToIndex:4];
                    result = @(ys.integerValue);
                }
            }
            
            return result;
        }];
    }];
    return mapping;
}

- (NSString *)bigArtworkUrlStr
{
    NSArray *comps = [self.artworkUrl pathComponents];
    NSString *end = [comps lastObject];
    CGFloat width = CGRectGetWidth(MAIN_SCREEN.bounds)*MAIN_SCREEN.scale;
    NSString *newEnd = [end stringByReplacingOccurrencesOfString:@"100" withString:[NSString stringWithFormat:@"%d", (int)width]];
    NSString *s = [self.artworkUrl stringByReplacingOccurrencesOfString:end withString:newEnd];    
    return s;
}

- (NSString *)artistAndAlbumTitle
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

@end
