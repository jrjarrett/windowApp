//
//  StoryView.m
//  ScrollViewTest
//
//  Created by James Jarrett on 11/19/10.
//  Copyright 2010 LYPSinc™. All rights reserved.
//

#import "StoryView.h"


@implementation StoryView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	
	CGRect bounds = self.bounds;
	CGFloat lineSpacing =  CGRectGetMaxY(bounds)/5.0f;
	NSLog(@"lineSpacing is %f",lineSpacing);
	NSLog(@"lineSpacing * 2 is %f",lineSpacing * 2.0f);
	NSLog(@"lineSpacing * 3 is %f",lineSpacing * 3.0f);
	
	//	//Frame view rectangle
	CGMutablePathRef wholeCard = CGPathCreateMutable();
	CGPathMoveToPoint(wholeCard, NULL, 0.0f, 0.0f);
	CGPathAddLineToPoint(wholeCard, NULL, CGRectGetMaxX(bounds), 0.0f);
	CGPathAddLineToPoint(wholeCard,NULL,CGRectGetMaxX(bounds),CGRectGetMaxY(bounds));
	CGPathAddLineToPoint(wholeCard, NULL, 0.0f, CGRectGetMaxY(bounds));
	
	//CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(wholeCard, NULL, 0.0f, lineSpacing * 1.0f);
	CGPathAddLineToPoint(wholeCard, NULL, CGRectGetMaxX(bounds), lineSpacing * 1.0f);
	
	CGPathMoveToPoint(wholeCard, NULL, 0.0f, lineSpacing * 2.0f);
	CGPathAddLineToPoint(wholeCard, NULL, CGRectGetMaxX(bounds), lineSpacing * 2.0f);
	
	CGPathMoveToPoint(wholeCard, NULL, 0.0f, lineSpacing * 3.0f);
	CGPathAddLineToPoint(wholeCard, NULL, CGRectGetMaxX(bounds), lineSpacing * 3.0f);
	
	CGPathMoveToPoint(wholeCard, NULL, 0.0f, lineSpacing * 4.0f);
	CGPathAddLineToPoint(wholeCard, NULL, CGRectGetMaxX(bounds), lineSpacing * 4.0f);
	
	CGPathCloseSubpath(wholeCard);
	
//	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
	CGContextAddPath(ctx, wholeCard);
	CGContextFillPath(ctx);
	
	//Draw lines on index card
	
	CGContextSetLineWidth(ctx, 0.5f);
	CGContextSetStrokeColorWithColor(ctx,[UIColor blackColor].CGColor);
	CGContextAddPath(ctx, wholeCard);
	CGContextStrokePath(ctx);
}


- (void)dealloc {
    [super dealloc];
}


@end
