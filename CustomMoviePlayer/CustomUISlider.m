//
//  CustomUISlider.m
//  CustomMoviePlayer
//
//  Created by Joshua Grenon on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomUISlider.h"

@implementation CustomUISlider

@synthesize totalVideoTime;
@synthesize IsTouch;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)thumbRect {
    CGRect trackRect = [self trackRectForBounds:self.bounds];
    CGRect thumbR = [self thumbRectForBounds:self.bounds
                                   trackRect:trackRect
                                       value:self.value];
    return thumbR;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
       
    IsTouch = YES;
    
    CGPoint touchPoint = [touch locationInView:self];
    
    if(!CGRectContainsPoint(self.thumbRect, touchPoint)) 
    {
        NSLog(@"totalvideotime: %f",self.totalVideoTime);
        
        CGFloat touchDivider = self.frame.size.width/self.totalVideoTime;
        
        CGFloat touchedLocation = touchPoint.x/touchDivider;
        
        NSLog(@"touched value: %f",touchedLocation);
        //NSLog(@"width: %f",self.frame.size.width);
        NSLog(@"touhcpoint: %@",NSStringFromCGPoint(touchPoint));
        
        [self setValue:touchedLocation animated:NO];
    }   

    
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    NSLog(@"in continuetracking");    
    
    return [super continueTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
   
    NSLog(@"in endtracking");
    
       
    [super endTrackingWithTouch:touch withEvent:event];
}


- (void)dealloc
{
    [super dealloc];
}

@end
