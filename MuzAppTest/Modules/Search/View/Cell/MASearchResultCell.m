//
//  MASearchResultCell.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MASearchResultCell.h"

#import "MASearchResultCellObject.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MASearchResultCell ()

@property (nonatomic, weak) IBOutlet UIImageView *coverView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistLabel;

@end

@implementation MASearchResultCell

- (void)configureWithObject:(MASearchResultCellObject *)object
{
    [self.coverView sd_setImageWithURL:[object imageUrl]];
    self.titleLabel.text = object.trackName;
    self.artistLabel.text = [object artistTitle];
}

@end
