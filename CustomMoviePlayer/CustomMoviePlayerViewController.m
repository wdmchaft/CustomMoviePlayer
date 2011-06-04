//
//  CustomMoviePlayerViewController.m
//  CustomMoviePlayer
//
//  Created by Joshua Grenon on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomMoviePlayerViewController.h"

@implementation CustomMoviePlayerViewController

@synthesize sliderTimeline;
@synthesize filePath;
@synthesize movieTitle;
@synthesize player_type;

@synthesize moviePlayer;
@synthesize totalVideoTime;
@synthesize imgPreviewImage;
@synthesize btnReturnToCarousel;
@synthesize ShowReturnToCarouselButton;
@synthesize toolMovieControls;
@synthesize barPlay;
@synthesize barStepForward;
@synthesize barStepBackward; 

- (void)dealloc
{
    [super dealloc];
}

-(id)initWithMovieURL:(NSString *)fileURL
{
    self.filePath = fileURL;
	[super initWithNibName:@"CustomMoviePlayerViewController" bundle:nil];	
	return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
    //add video to subviewe
    NSURL *movieURL = [NSURL fileURLWithPath:self.filePath];
    
    MPMoviePlayerController *mp = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
	if (mp)
	{
		// save the movie player object
		self.moviePlayer = mp;
		[mp release];
		
        //get movie preview image so there will be no blink when the movie starts
        [self performSelector:@selector(setTotalVideoTimeDuration) withObject:nil afterDelay:0.1];
        imgPreviewImage.image = [self.moviePlayer thumbnailImageAtTime:0.0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        
		// Apply the user specified settings to the movie player object
		[self setMoviePlayerUserSettings];
        self.moviePlayer.view.hidden = YES;
        self.moviePlayer.shouldAutoplay = NO;
		self.moviePlayer.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:moviePlayer.view];
        moviePlayer.view.frame = CGRectMake(20, 20, 728, 594);
    }
}
    
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
    
-(void)playerPlaybackDidFinish:(NSNotification*)notification
{
    barPlay.image = [UIImage imageNamed:@"UIButtonBarPlay.png"];
    barPlay.tag = 0;
}

-(void)setTotalVideoTimeDuration
{
    self.totalVideoTime = self.moviePlayer.duration;
    //NSLog(@"totalVideoTime: %f",self.totalVideoTime);
    self.moviePlayer.currentPlaybackTime = 0;
}

-(IBAction)onTimeSliderChange:(UISlider*)sender
{
    self.moviePlayer.currentPlaybackTime = totalVideoTime*sliderTimeline.value;
    [self monitorPlaybackTime];
}

-(IBAction)playMovie
{
    self.moviePlayer.view.hidden = NO;
    if (barPlay.tag == 0) 
    {       
        if (self.totalVideoTime != 0 && self.moviePlayer.currentPlaybackTime >= totalVideoTime)
        {
            //-------- rewind code:
            self.moviePlayer.currentPlaybackTime = 0;
            self.sliderTimeline.value = 0.0;
        }        
        
        NSLog(@"timeline: %f",self.sliderTimeline.value);
        // self.moviePlayer.currentPlaybackTime = 0;
        [self monitorPlaybackTime];
        [self.moviePlayer play];
        
        barPlay.image = [UIImage imageNamed:@"UIButtonBarPause.png"];
        barPlay.tag = 1;
    }
    else if(barPlay.tag == 1)
    {
        [self.moviePlayer pause];
        barPlay.image = [UIImage imageNamed:@"UIButtonBarPlay.png"];
        barPlay.tag = 0;
    }          
}

-(void)monitorPlaybackTime
{
    NSLog(@"currentPlaybackTime: %f",self.moviePlayer.currentPlaybackTime);
    self.sliderTimeline.value = self.moviePlayer.currentPlaybackTime / self.totalVideoTime;
    //constantly keep checking if at the end of video:
    if (self.totalVideoTime != 0 && self.moviePlayer.currentPlaybackTime >= totalVideoTime)
    {
        //-------- rewind code:
        //self.moviePlayer.currentPlaybackTime = 0;
        [self.moviePlayer pause];
        barPlay.image = [UIImage imageNamed:@"UIButtonBarPlay.png"];
        barPlay.tag = 0;
    }
    else
    {
        [self performSelector:@selector(monitorPlaybackTime) withObject:nil afterDelay:0.1];
    }
}

-(void)setMoviePlayerUserSettings
{
    /* Now apply these settings to the active Movie Player (MPMoviePlayerController) object  */
    
    /* 
     Movie scaling mode can be one of: MPMovieScalingModeNone, MPMovieScalingModeAspectFit,
     MPMovieScalingModeAspectFill, MPMovieScalingModeFill.
     */
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    //Dont show movie controls
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    /*
     The color of the background area behind the movie can be any UIColor value.
     */
	self.moviePlayer.backgroundView.backgroundColor = [UIColor whiteColor];
    
	/*
     The time relative to the duration of the video when playback should start, if possible. 
     Defaults to 0.0. When set, the closest key frame before the provided time will be used as the 
     starting frame.
     self.moviePlayer.initialPlaybackTime = <specify a movie time here>;
     
     */
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(IBAction)setValueByTouch:(UISlider*)sender
{
    NSLog(@"touch location");
}

@end