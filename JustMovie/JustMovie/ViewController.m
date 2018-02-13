//
//  ViewController.m
//  JustMovie
//
//  Created by home on 2018/2/13.
//  Copyright © 2018年 home. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *useMPMoviePlayerController;
@property (nonatomic, strong) MPMoviePlayerController * moviePlayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

- (IBAction)useMPMoviePlayerController:(id)sender
{
    if (_moviePlayer == nil) {
        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[self movieURL]];
        _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        _moviePlayer.controlStyle = MPMovieControlStyleDefault;
        [self.view addSubview:_moviePlayer.view];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector: @selector(playbackFinished4MoviePlayerController:)
                                                     name:MPMoviePlayerPlaybackDidFinishNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(doneButtonClick:)
                                                     name:MPMoviePlayerWillExitFullscreenNotification
                                                   object:nil];
    }
    
    [_moviePlayer play];
    [_moviePlayer setFullscreen:YES animated:YES];
}

- (void) playbackFinished4MoviePlayerController: (NSNotification*) notification
{
    NSLog(@"使用MPMoviePlayerController播放完成.");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_moviePlayer stop];
    [_moviePlayer.view removeFromSuperview];
    _moviePlayer = nil;
}

-(void)doneButtonClick:(NSNotification*)aNotification
{
    NSLog(@"退出全屏.");
    if (_moviePlayer.playbackState == MPMoviePlaybackStateStopped)
    {
        [_moviePlayer.view removeFromSuperview];
        _moviePlayer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
