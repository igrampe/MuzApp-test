//
//  MAAppAssembly.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAAppAssembly.h"
#import "AppDelegate.h"

@implementation MAAppAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition)
    {
        
    }];
}

@end
