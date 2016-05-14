//
//  MASearchViewInput.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol MASearchViewInput <NSObject>

- (void)updateWithSearchResults:(NSArray *)searchResults;
- (void)showLoader;
- (void)hideLoader;
- (void)showResults;
- (void)hideResults;
- (void)showErrorWithMessage:(NSString *)message;
- (void)showNoResults;

- (NSString *)valueSearchBarText;

@end
