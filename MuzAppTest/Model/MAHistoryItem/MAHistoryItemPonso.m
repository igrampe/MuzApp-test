//
//  MAHistoryItemPonso.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAHistoryItemPonso.h"

@implementation MAHistoryItemPonso

+ (MAHistoryItemPonso *)objectWithQuery:(NSString *)query
                                   date:(NSDate *)date
{
    MAHistoryItemPonso *object = [MAHistoryItemPonso new];
    object.query = query;
    object.queryDate = date;
    
    return object;
}

@end
