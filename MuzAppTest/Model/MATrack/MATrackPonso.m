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
    }];
    return mapping;
}

@end
