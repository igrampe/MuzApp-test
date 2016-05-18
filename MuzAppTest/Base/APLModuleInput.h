//
//  APLModuleInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 15/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APLModuleOutput;

@protocol APLModuleInput <NSObject>

@optional

- (void)setModuleOutput:(id<APLModuleOutput>)moduleOutput;

@end
