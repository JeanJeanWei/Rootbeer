//
//  IntroViewController.h
//  Rootbeer
//
//  Created by Jean-Jean Wei on 13-01-19.
//  Copyright (c) 2013 Ice Whale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController
{
    IBOutlet UIImageView *layer0;
    IBOutlet UIImageView *layer1;
    IBOutlet UIButton *btnClickHere;
    NSTimer *timer_touch;
}

- (IBAction)clickHerePressed;

@end
