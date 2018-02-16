//
//  ViewController.m
//  MPMoviePlayerSample
//
//  Created by 张佳鹏 on 2018/2/16.
//  Copyright © 2018年 jump. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (nonatomic, strong) MPMoviePlayerViewController * moviePlayerView;
@property (weak, nonatomic) IBOutlet UIButton *useMPMoviePlayerViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)useMPMoviePlayerViewController:(id)sender
{
    if (_moviePlayerView == nil) {
        
        NSLog(@"%@",[self movieURL]);
        
        _moviePlayerView = [[MPMoviePlayerViewController alloc] initWithContentURL:[self movieURL]];
        _moviePlayerView.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
        _moviePlayerView.moviePlayer.controlStyle =	MPMovieControlStyleEmbedded;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector: @selector(playbackFinished4MoviePlayerViewController:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification
                                                   object:nil];
    }
    
    
    [self presentMoviePlayerViewControllerAnimated:_moviePlayerView];
}

-(NSURL *)movieURL
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *moviePath = [bundle pathForResource:@"YY"
                                           ofType:@"mp4"];
    
    if (moviePath) {
        return [NSURL fileURLWithPath:moviePath];
    } else {
        return nil;
    }
}
- (void) playbackFinished4MoviePlayerViewController: (NSNotification*) notification
{
    NSLog(@"使用MPMoviePlayerViewController播放完成.");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_moviePlayerView dismissMoviePlayerViewControllerAnimated];
    _moviePlayerView = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
