//
//  MADataManager.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MAHistoryItemPonso;

@protocol MADataManager <NSObject>

- (void)addHistoryItem:(MAHistoryItemPonso *)ponso;
- (NSArray <MAHistoryItemPonso *> *)historyItems;

@end
