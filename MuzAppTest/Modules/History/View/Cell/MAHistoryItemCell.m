//
//  MAHistoryItemCell.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAHistoryItemCell.h"

#import "MAHistoryItemCellObject.h"

@interface MAHistoryItemCell ()

@property (nonatomic, weak) IBOutlet UILabel *queryLabel;

@end

@implementation MAHistoryItemCell

- (void)configureWithObject:(MAHistoryItemCellObject *)object
{
    self.queryLabel.text = object.query;
}

@end
