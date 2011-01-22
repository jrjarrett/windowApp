//
//  windowAppAppDelegate.h
//  windowApp
//
//  Created by James Jarrett on 1/21/11.
//  Copyright 2011 LYPSinc™. All rights reserved.
//

#import <UIKit/UIKit.h>

@class windowAppViewController;

@interface windowAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    windowAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet windowAppViewController *viewController;

@end

