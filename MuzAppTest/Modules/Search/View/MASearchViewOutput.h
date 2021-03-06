//
//  MASearchViewOutput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol MASearchViewOutput <NSObject>

- (void)viewWillAppear;
- (void)actionSearchBarActivate;
- (void)actionSearchBarTextDidChange;
- (void)actionSearchBarSearch;
- (void)actionDidSelectItemAtIndex:(NSInteger)index;
- (void)actionCancel;

@end
