//
//  LYScrollView.m
//  ScrollViewTest
//
//  Created by James Jarrett on 1/17/11.
//  Copyright 2011 LYPSinc™. All rights reserved.
//

#import "LYScrollView.h"
#import "StoryView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LYScrollView

#pragma mark -
#pragma mark === Touch handling  ===
#pragma mark

- (void)addGestureRecognizersToPiece:(UIView *)piece
{
     
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPiece:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [piece addGestureRecognizer:panGesture];
    [panGesture release];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showResetMenu:)];
    [piece addGestureRecognizer:longPressGesture];
    [longPressGesture release];
}

// scale and rotation transforms are applied relative to the layer's anchor point
// this method moves a gesture recognizer's view's anchor point between the user's fingers
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

// shift the piece's center by the pan amount
// reset the gesture recognizer's translation to {0, 0} after applying so the next callback is a delta from the current position
- (void)panPiece:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *piece = [gestureRecognizer view];
    
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
        
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
    }
}
// ensure that the pinch, pan and rotate gesture recognizers on a particular view can all recognize simultaneously
// prevent other gesture recognizers from recognizing simultaneously
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
     // if the gesture recognizers are on different views, don't allow simultaneous recognition
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
     return YES;
}

//Adding story views
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	for (UITouch * t in touches) {
		
		if ([t tapCount] > 1) {
			
			
			NSLog(@"Drawing view?");
			
			CGPoint loc = [t locationInView:self];
			StoryView *story = [[StoryView alloc] initWithFrame:CGRectMake(loc.x,loc.y,150,90)];
			story.backgroundColor = [UIColor greenColor];
			[self addGestureRecognizersToPiece:story];
			[self addSubview:story];
			[story release];
		}
		[self setNeedsDisplay];
	}
	
}




#pragma mark -

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
