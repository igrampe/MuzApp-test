//
//  MAServiceComponentsAssembly.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAServiceComponentsAssembly.h"

#import "MAApiManagerImpl.h"
#import "MADataManagerImpl.h"

@implementation MAServiceComponentsAssembly

- (id<MAApiManager>)apiManager
{
    return [TyphoonDefinition withClass:[MAApiManagerImpl class]
                          configuration:^(TyphoonDefinition *definition)
    {
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

- (id<MADataManager>)dataManager
{
    return [TyphoonDefinition withClass:[MADataManagerImpl class]
                          configuration:^(TyphoonDefinition *definition)
    {
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

@end
