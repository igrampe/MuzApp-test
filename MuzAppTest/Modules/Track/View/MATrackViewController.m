//
//  MATrackViewController.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 19/05/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "MATrackViewController.h"

#import "MATrackViewOutput.h"

#import <SDWebimage/UIImageView+WebCache.h>

#import "MATrackPonso.h"

@interface MATrackViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *coverView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistLabel;
@property (nonatomic, weak) IBOutlet UILabel *genreLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;

@end

@implementation MATrackViewController

@synthesize moduleInput;

#pragma mark - Lifecycle

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

#pragma mark - MATrackViewInput

- (void)configureWithTrack:(MATrackPonso *)track
{
    [self.coverView sd_setImageWithURL:[NSURL URLWithString:[track bigArtworkUrlStr]]];
    self.titleLabel.text = track.trackName;
    self.artistLabel.text = [track artistAndAlbumTitle];
    self.genreLabel.text = track.genreName;
    self.yearLabel.text = [NSString stringWithFormat:@"%@", track.year];
}

@end
