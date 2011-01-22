//
//  windowAppViewController.m
//  windowApp
//
//  Created by James Jarrett on 1/21/11.
//  Copyright 2011 LYPSinc™. All rights reserved.
//

#import "windowAppViewController.h"
#import	"StoryView.h"

@implementation windowAppViewController
@synthesize toolbar;
@synthesize scrollView;
@synthesize entireView;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

-(IBAction)buttonPushed:(id)sender {
	
	NSLog(@"Button pushed");
	StoryView *story = [[StoryView alloc] initWithFrame:CGRectMake(storyPoint.x,storyPoint.y,150,90)];
	story.backgroundColor = [UIColor greenColor];
	[scrollView addSubview:story];
	[story release];
	storyPoint.x = storyPoint.x + 200.0;
	storyPoint.x = storyPoint.x + 200.0;
	
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[scrollView setCanCancelContentTouches:NO];
//	scrollView.clipsToBounds = YES;	// default is NO, we want to restrict drawing within our scrollview
//	//scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;

	[scrollView setScrollEnabled:YES];
	
	storyPoint = CGPointMake(100.0,100.0);
	
	CGRect wholeWindow = [entireView bounds];
	

	// Make your view twice as large as the window
	CGRect reallyBigRect;
	reallyBigRect.origin = CGPointZero;
	reallyBigRect.size.width = wholeWindow.size.width * 2;
	reallyBigRect.size.height = wholeWindow.size.height * 2;
	[scrollView setContentSize:reallyBigRect.size];
	
	// Center it in the scroll view
//	CGPoint offset;
//	offset.x = wholeWindow.size.width * 0.5;
//	offset.y = wholeWindow.size.height * 0.5;
//	[scrollView setContentOffset:offset];
	
	// Enable zooming
	[scrollView setMinimumZoomScale:0.5];
	[scrollView setMaximumZoomScale:5];
	[scrollView setDelegate:self];
	
	CGSize newSize = [scrollView contentSize];
	NSLog(@"The new size is %f x %f",newSize.width,newSize.height);
	
}

#pragma mark UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	// return view;
	return nil;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
