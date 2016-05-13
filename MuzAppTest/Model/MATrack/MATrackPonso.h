//
//  MATrackPonso.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping.h>

@interface MATrackPonso : NSObject <EKMappingProtocol>

@property (nonatomic, strong) NSNumber *trackId;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *collectionName;
@property (nonatomic, strong) NSString *artworkUrl;

@end
