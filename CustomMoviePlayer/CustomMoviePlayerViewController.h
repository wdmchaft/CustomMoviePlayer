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
    
    IBOutlet UIButton *btnPlay;
    IBOutlet UIButton *btnStop;
    IBOutlet UISlider *sliderTimeline;
    IBOutlet UIImageView *imgPreviewImage;
    NSString *filePath;
    
    MPMoviePlayerController *moviePlayer;
    NSTimeInterval totalVideoTime;
}

-(id)initWithMovieURL:(NSString *)fileURL;

@property(nonatomic, retain) IBOutlet UIButton *btnPlay;
@property(nonatomic, retain) IBOutlet UIButton *btnStop;
@property(nonatomic, retain) IBOutlet UIImageView *imgPreviewImage;
@property(nonatomic, retain) IBOutlet UISlider *sliderTimeline;

@property(nonatomic, retain) NSString *filePath;  

@property (readwrite, retain) MPMoviePlayerController *moviePlayer;
@property(nonatomic, assign) NSTimeInterval totalVideoTime;

-(void)setMoviePlayerUserSettings;
-(IBAction)playMovie;
-(IBAction)stopMovie;
-(void)monitorPlaybackTime;
-(IBAction)onTimeSliderChange:(UISlider*)sender;

@end
