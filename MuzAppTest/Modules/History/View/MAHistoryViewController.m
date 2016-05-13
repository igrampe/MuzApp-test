//
//  MAHistoryViewController.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MAHistoryViewController.h"

#import "MAHistoryViewOutput.h"

#import "MAHistoryItemCell.h"
#import "MAHistoryItemCellObject.h"

#import "UIViewController+APLKeyboardHandler.h"

@interface MAHistoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *historyItems;

@end

@implementation MAHistoryViewController

@synthesize hasKeyboard;

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    [self mock];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setupView];
    [self setupKeyboardHandler];
}

- (void)setupView
{
    self.tableView.backgroundView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self keyboardUpdate];
}

#pragma mark - MAHistoryViewInput

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAHistoryItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MAHistoryItemCell"];
    
    MAHistoryItemCellObject *object = self.historyItems[indexPath.row];
    
    [cell configureWithObject:object];
    
    return cell;
}

#pragma mark - Mock

- (void)mock
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 100; i++)
    {
        MAHistoryItemCellObject *object = [MAHistoryItemCellObject mock];
        [arr addObject:object];
    }
    
    self.historyItems = [NSArray arrayWithArray:arr];
}

@end
