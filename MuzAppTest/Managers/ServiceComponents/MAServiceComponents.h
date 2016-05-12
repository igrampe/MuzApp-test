//
//  MAServiceComponents.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MADataManager;
@protocol MAApiManager;

@protocol MAServiceComponents <NSObject>

- (id<MADataManager>)dataManager;
- (id<MAApiManager>)apiManager;

@end