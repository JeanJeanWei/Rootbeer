//
//  StartupController.m
//  Common Framework
//
//  Created by Jean-Jean Wei on 12-05-25.
//  Copyright (c) 2012 Ice Whale. All rights reserved.
//

#import "StartupController.h"
#import "IntroViewController.h"

@implementation StartupController

+ (StartupController*)instance
{
    static StartupController* instance = nil;
    
    if (!instance)
    {
        instance = [StartupController new];
    }
    
    return instance;
}

- (UIViewController*)startingViewController
{
     
    IntroViewController *menuViewController = [IntroViewController new];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    [navigationController setNavigationBarHidden:YES];
 
    
    return navigationController;
}




@end
