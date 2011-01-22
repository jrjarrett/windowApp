//
//  windowAppViewController.h
//  windowApp
//
//  Created by James Jarrett on 1/21/11.
//  Copyright 2011 LYPSinc™. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface windowAppViewController : UIViewController <UIScrollViewDelegate> {
	IBOutlet UIView *entireView;
	IBOutlet UIToolbar *toolbar;
	IBOutlet UIScrollView *scrollView;
	CGPoint storyPoint;

}

@property(nonatomic,retain) IBOutlet UIToolbar *toolbar;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain) IBOutlet UIView *entireView;


-(IBAction)buttonPushed:(id)sender;
@end

