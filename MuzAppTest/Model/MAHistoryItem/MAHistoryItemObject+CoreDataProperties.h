//
//  MAHistoryItemObject+CoreDataProperties.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MAHistoryItemObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MAHistoryItemObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *query;
@property (nullable, nonatomic, retain) NSDate *queryDate;

@end

NS_ASSUME_NONNULL_END
