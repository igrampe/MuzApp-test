//
//  MASearchResultCell.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MASearchResultCellObject;

@interface MASearchResultCell : UITableViewCell

- (void)configureWithObject:(MASearchResultCellObject *)object;

@end
