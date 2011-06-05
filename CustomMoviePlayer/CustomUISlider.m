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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    NSLog(@"in begintracking");
    
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"touhcpoint: %@",NSStringFromCGPoint(touchPoint));
    
    [self setValue:0.6 animated:YES];
    
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
