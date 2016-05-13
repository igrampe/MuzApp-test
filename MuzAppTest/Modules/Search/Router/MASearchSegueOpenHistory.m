//
//  MASearchSegueOpenHistory.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MASearchSegueOpenHistory.h"

@implementation MASearchSegueOpenHistory

- (void)perform
{
    [self.sourceViewController addChildViewController:self.destinationViewController];
    [self.sourceViewController.view addSubview:self.destinationViewController.view];
    [self.destinationViewController didMoveToParentViewController:self.sourceViewController];
    
    __weak typeof(self) welf = self;
    self.destinationViewController.view.alpha = 0;
    [UIView animateWithDuration:0.5
                     animations:
     ^
    {
        welf.destinationViewController.view.alpha = 1;
    }];
}

@end
