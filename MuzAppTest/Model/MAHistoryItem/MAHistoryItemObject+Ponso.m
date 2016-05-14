//
//  MAHistoryItemObject+Ponso.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 14/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAHistoryItemObject+Ponso.h"

#import "MAHistoryItemPonso.h"

@implementation MAHistoryItemObject (Ponso)

- (void)fillWithPonso:(MAHistoryItemPonso *)ponso
{
    self.query = ponso.query;
    self.queryDate = ponso.queryDate;
}

- (MAHistoryItemPonso *)ponso
{
    MAHistoryItemPonso *ponso = [MAHistoryItemPonso new];
    
    ponso.query = self.query;
    ponso.queryDate = self.queryDate;
    
    return ponso;
}

@end
