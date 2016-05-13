//
//  MAHistoryItemCellObject.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MAHistoryItemPonso;

@interface MAHistoryItemCellObject : NSObject

@property (nonatomic, strong) NSString *query;

+ (MAHistoryItemCellObject *)objectWithHistoryItem:(MAHistoryItemPonso *)item;

+ (MAHistoryItemCellObject *)mock;

@end
