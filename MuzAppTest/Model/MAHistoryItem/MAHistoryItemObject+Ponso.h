//
//  MAHistoryItemObject+Ponso.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 14/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAHistoryItemObject.h"

@class MAHistoryItemPonso;

@interface MAHistoryItemObject (Ponso)

- (void)fillWithPonso:(MAHistoryItemPonso *)ponso;
- (MAHistoryItemPonso *)ponso;

@end
