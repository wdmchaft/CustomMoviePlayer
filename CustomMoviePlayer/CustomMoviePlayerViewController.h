//
//  CustomMoviePlayerViewController.h
//  CustomMoviePlayer
//
//  Created by Joshua Grenon on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CustomMoviePlayerViewController : UIViewController {
    
    IBOutlet UISlider *sliderTimeline;
    IBOutlet UIImageView *imgPreviewImage;
    
    IBOutlet UIToolbar *toolMovieControls;
    
    IBOutlet UIBarButtonItem *barPlay;
    IBOutlet UIBarButtonItem *barStepForward;
    IBOutlet UIBarButtonItem *barStepBackward;
    
    NSString *filePath;
    NSString *movieTitle;
    NSString *player_type;
    
    BOOL ShowReturnToCarouselButton;
    
    IBOutlet UIButton *btnReturnToCarousel;
    
    MPMoviePlayerController *moviePlayer;
    NSTimeInterval totalVideoTime; 
}

-(id)initWithMovieURL:(NSString *)fileURL;

@property(nonatomic, retain) IBOutlet UIImageView *imgPreviewImage;
@property(nonatomic, retain) IBOutlet UISlider *sliderTimeline;

@property(nonatomic, retain) IBOutlet UIToolbar *toolMovieControls;
@property(nonatomic, retain) IBOutlet UIBarButtonItem *barPlay;
@property(nonatomic, retain) IBOutlet UIBarButtonItem *barStepForward;
@property(nonatomic, retain) IBOutlet UIBarButtonItem *barStepBackward;

@property(nonatomic, retain) NSString *filePath;
@property(nonatomic, retain) NSString *movieTitle;
@property(nonatomic, retain) NSString *player_type;

@property(nonatomic, assign) BOOL ShowReturnToCarouselButton;
@property(nonatomic, retain) IBOutlet UIButton *btnReturnToCarousel;

@property (readwrite, retain) MPMoviePlayerController *moviePlayer;
@property(nonatomic, assign) NSTimeInterval totalVideoTime;

-(void)setMoviePlayerUserSettings;
-(IBAction)playMovie; 
-(void)monitorPlaybackTime;
-(IBAction)onTimeSliderChange:(UISlider*)sender;
 
-(void)setTotalVideoTimeDuration;
-(IBAction)setValueByTouch:(UISlider*)sender;

@end
