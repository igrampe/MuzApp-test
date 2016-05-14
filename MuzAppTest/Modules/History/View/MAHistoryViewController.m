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
//    [self mock];
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
    [self.output viewWillAppear];
}

#pragma mark - MAHistoryViewInput

- (void)updateWithHistoryItems:(NSArray <MAHistoryItemPonso *>*)historyItems
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (MAHistoryItemPonso *ponso in historyItems)
    {
        MAHistoryItemCellObject *object = [MAHistoryItemCellObject objectWithHistoryItem:ponso];
        [arr addObject:object];
    }
    
    self.historyItems = [NSArray arrayWithArray:arr];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAHistoryItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MAHistoryItemCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[MAHistoryItemCell class]])
    {
        MAHistoryItemCell *c = (MAHistoryItemCell *)cell;
        
        MAHistoryItemCellObject *object = self.historyItems[indexPath.row];
        [c configureWithObject:object];
    }
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
