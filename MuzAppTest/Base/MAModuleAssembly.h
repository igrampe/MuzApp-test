//
//  MAModuleAssembly.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "MAServiceComponents.h"

@interface MAModuleAssembly : TyphoonAssembly

@property (strong, nonatomic, readonly) TyphoonAssembly <MAServiceComponents> *serviceComponents;

@end
