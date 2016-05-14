//
//  MADataManagerImpl.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MADataManagerImpl.h"

#import <CoreData/CoreData.h>
#import "APLFileSystem.h"
#import "Constants.h"

#import "MAHistoryItemObject.h"
#import "MAHistoryItemObject+Ponso.h"

#import "MATrackObject.h"
#import "MATrackObject+Ponso.h"

@interface MADataManagerImpl ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation MADataManagerImpl

#pragma mark - MADataManager

#pragma mark -- History

- (void)addHistoryItem:(MAHistoryItemPonso *)ponso
{
    MAHistoryItemObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"MAHistoryItemObject"
                                                                inManagedObjectContext:self.managedObjectContext];
    [object fillWithPonso:ponso];
    
    [self saveContext];
}

- (NSArray <MAHistoryItemPonso *> *)historyItems
{
    NSMutableArray *result = [NSMutableArray new];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"MAHistoryItemObject"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"queryDate"
                                                                     ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *items = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!error)
    {
        for (MAHistoryItemObject *object in items)
        {
            MAHistoryItemPonso *ponso = [object ponso];
            [result addObject:ponso];
        }
    }
    
    return result;
}

#pragma mark -- Tracks

- (void)addTracks:(NSArray <MATrackPonso *>*)tracks
{
    for (NSInteger i = 0; i < tracks.count; i++)
    {
        MATrackPonso *ponso = tracks[i];
        MATrackObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"MATrackObject"
                                                              inManagedObjectContext:self.managedObjectContext];
        [object fillWithPonso:ponso];
        object.searchOrder = @(i);
    }
    
    [self saveContext];
}

- (NSArray <MATrackPonso *>*)tracks
{
    NSMutableArray *result = [NSMutableArray new];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"MATrackObject"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"searchOrder"
                                                                     ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *items = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!error)
    {
        for (MATrackObject *object in items)
        {
            MATrackPonso *ponso = [object ponso];
            [result addObject:ponso];
        }
    }
    
    return result;
}

- (MATrackPonso *)trackWithId:(NSNumber *)trackId
{
    return nil;
}

#pragma mark - CoreData

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel)
    {
        return _managedObjectModel;
    }
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator)
    {
        return _persistentStoreCoordinator;
    }
    
    
    NSString *path = [APLFileSystem documentsPathWidthSubPath:[NSString stringWithFormat:@"%@.sqlite", DB_NAME]];
    
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSError *error = nil;
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:storeURL
                                                    options:nil
                                                      error:&error];
    
    NSAssert(!error, [[error userInfo] description]);
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *storeCoordinator = self.persistentStoreCoordinator;
    
    if (storeCoordinator)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:storeCoordinator];
    }
    
    return _managedObjectContext;
}

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges])
        {
            [managedObjectContext save:&error];
            NSAssert(!error, [[error userInfo] description]);
        }
    }
}

@end
