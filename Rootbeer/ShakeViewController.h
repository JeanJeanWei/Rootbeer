//
//  ShakeViewController.h
//  Rootbeer
//
//  Created by Jean-Jean Wei on 12-11-19.
//  Copyright (c) 2012 Jean-Jean Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ShakeViewController : UIViewController <UIAccelerometerDelegate>
{
    int gyro;
    CMMotionManager *motionManager;
    CMAttitude *referenceAttitude;
    UIAccelerometer *accel;
    
    IBOutlet UISlider *progress;
  //  IBOutlet UIProgressView *progress;
    
    NSTimer *timer;
    
    IBOutlet UIImageView *bg;
    IBOutlet UIImageView *charactor;
}
- (IBAction)backPressed;

@end
