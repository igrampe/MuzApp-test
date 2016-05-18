//
//  MAHistoryPresenter.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryPresenter.h"

#import "MAHistoryViewInput.h"
#import "MAHistoryInteractorInput.h"
#import "MAHistoryRouterInput.h"

#import "MAHistoryItemPonso.h"

@interface MAHistoryPresenter ()

@property (nonatomic, strong) NSArray *historyItems;

@end

@implementation MAHistoryPresenter

#pragma mark - MAHistoryModuleInput

#pragma mark - MAHistoryViewOutput

- (void)viewWillAppear
{
    [self _reloadHistoryItems];
    [self.view updateWithHistoryItems:self.historyItems];
}

- (void)actionDidSelectItemAtIndex:(NSInteger)index
{
    MAHistoryItemPonso *item = self.historyItems[index];
    [self.moduleOutput historyModuleDidSelectHistoryItemWithQuery:item.query];
}

#pragma mark - MAHistoryInteractorOutput

#pragma mark - Internal

- (void)_reloadHistoryItems
{
    self.historyItems = [self.interactor dbHistoryItems];
}

@end
