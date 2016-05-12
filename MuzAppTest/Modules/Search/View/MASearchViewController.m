//
//  MASearchViewController.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MASearchViewController.h"

#import "MASearchViewOutput.h"

#import "MASearchResultCell.h"
#import "MASearchResultCellObject.h"

@interface MASearchViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray<MASearchResultCellObject *> *searchResults;

@end

@implementation MASearchViewController

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    [self mock];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setupView];
}

- (void)setupView
{

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.output viewWillAppear];
}

#pragma mark - MASearchViewInput

- (void)updateWithSearchResults:(NSArray *)searchResults
{
    NSMutableArray *arr = [NSMutableArray new];
    for (MATrackPonso *track in searchResults)
    {
        MASearchResultCellObject *object = [MASearchResultCellObject objectWithTrack:track];
        [arr addObject:object];
    }
    self.searchResults = [NSArray arrayWithArray:arr];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MASearchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MASearchResultCell"];
    
    MASearchResultCellObject *object = self.searchResults[indexPath.row];
    [cell configureWithObject:object];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Mock

- (void)mock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i < 1; i++)
    {
        MASearchResultCellObject *obj = [MASearchResultCellObject mock];
        [arr addObject:obj];
    }
    self.searchResults = [NSArray arrayWithArray:arr];
}

@end
