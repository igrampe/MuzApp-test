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

#import "UIViewController+APLKeyboardHandler.h"

@interface MASearchViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray<MASearchResultCellObject *> *searchResults;

@end

@implementation MASearchViewController

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

- (void)showLoader
{
    
}

- (void)hideLoader
{
    
}

#pragma mark -- Values

- (NSString *)valueSearchBarText
{
    return self.searchBar.text;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MASearchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MASearchResultCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[MASearchResultCell class]])
    {
        MASearchResultCell *c = (MASearchResultCell *)cell;
        MASearchResultCellObject *object = self.searchResults[indexPath.row];
        [c configureWithObject:object];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.output actionSearchBarActivate];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.output actionSearchBarTextDidChange];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.output actionSearchBarSearch];
}

#pragma mark - Mock

- (void)mock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i < 100; i++)
    {
        MASearchResultCellObject *obj = [MASearchResultCellObject mock];
        [arr addObject:obj];
    }
    self.searchResults = [NSArray arrayWithArray:arr];
}

#pragma mark - MARouterTransitionHandler

- (void)vc_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"OpenHistory"])
    {
        segue.destinationViewController.view.frame = CGRectMake(0,
                                                                CGRectGetMaxY(self.searchBar.frame),
                                                                self.view.frame.size.width,
                                                                self.view.frame.size.height-CGRectGetMaxY(self.searchBar.frame));
    }
}

@end
