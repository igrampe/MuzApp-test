//
//  MAHistoryItemCellObject.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAHistoryItemCellObject.h"

#import "MAHistoryItemPonso.h"

@implementation MAHistoryItemCellObject

+ (MAHistoryItemCellObject *)objectWithHistoryItem:(MAHistoryItemPonso *)item
{
    MAHistoryItemCellObject *object = [MAHistoryItemCellObject new];
    
    object.query = item.query;
    
    return object;
}

+ (MAHistoryItemCellObject *)mock
{
    MAHistoryItemCellObject *object = [MAHistoryItemCellObject new];
    
    object.query = @"The Weeknd";
    
    return object;
}

@end
