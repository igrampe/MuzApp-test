//
//  MADataManagerImpl.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MADataManagerImpl.h"

@interface MADataManagerImpl ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation MADataManagerImpl

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.items = [NSMutableArray new];
    }
    return self;
}

#pragma mark - MADataManager

- (void)addHistoryItem:(MAHistoryItemPonso *)ponso
{
    [self.items addObject:ponso];
}

- (NSArray <MAHistoryItemPonso *> *)historyItems
{
    return self.items;
}

@end
