//
//  MATrackObject+CoreDataProperties.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MATrackObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MATrackObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *trackId;
@property (nullable, nonatomic, retain) NSString *artistName;
@property (nullable, nonatomic, retain) NSString *trackName;
@property (nullable, nonatomic, retain) NSString *collectionName;
@property (nullable, nonatomic, retain) NSString *artworkUrl;

@end

NS_ASSUME_NONNULL_END
