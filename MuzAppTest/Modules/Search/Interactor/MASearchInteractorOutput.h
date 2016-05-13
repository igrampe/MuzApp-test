//
//  MASearchInteractorOutput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol MASearchInteractorOutput <NSObject>

- (void)didFinishApiSearchWithObjects:(NSArray *)objects;
- (void)didFailedApiSearchWithError:(NSError *)error;

@end
