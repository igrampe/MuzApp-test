//
//  MAHistoryItemPonso.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAHistoryItemPonso : NSObject

@property (nonatomic, strong) NSString *query;
@property (nonatomic, strong) NSDate *queryDate;

+ (MAHistoryItemPonso *)objectWithQuery:(NSString *)query date:(NSDate *)date;

@end
