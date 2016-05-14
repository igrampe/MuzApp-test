//
//  MAHistoryViewInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class MAHistoryItemPonso;

@protocol MAHistoryViewInput <NSObject>

- (void)updateWithHistoryItems:(NSArray <MAHistoryItemPonso *>*)historyItems;

@end
