//
//  ShakeViewController.m
//  Rootbeer
//
//  Created by Jean-Jean Wei on 12-11-19.
//  Copyright (c) 2012 Jean-Jean Wei. All rights reserved.
//

#import "ShakeViewController.h"

@implementation ShakeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     UIImage *a= [[UIImage imageNamed:@"img_tile_empty_fill.png"]
     stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
     UIImage *b= [[UIImage imageNamed:@"img_tile_red_fill.png"]
     stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
     
     [progress setThumbImage: [UIImage imageNamed:@"Nothing.png"] forState:UIControlStateNormal];
   //  [progress setMinimumTrackImage:[UIImage imageNamed:@"slider_glucose_red@2x.png"] forState:UIControlStateNormal];
    [progress setMinimumTrackImage:[UIImage imageNamed:@"bar1.png"] forState:UIControlStateNormal];
    [progress setMaximumTrackImage:[UIImage imageNamed:@"bar2.png"] forState:UIControlStateNormal];
    // [progress setMaximumTrackImage:[UIImage imageNamed:@"slider_glucose_min@2x.png"] forState:UIControlStateNormal];
    
//      [progress setProgressImage:[UIImage imageNamed:@"slider_glucose_red@2x.png"]];
//    [progress setTrackImage:[UIImage imageNamed:@"slider_glucose_min@2x.png"]];
   // self.view.autoresizesSubviews=NO;
    
    
  
//    CGRect frame = progress.frame;
//    frame.origin.x = 10;
//    frame.origin.y = 480;
//    progress.frame = frame;
    
//     progress.transform = CGAffineTransformMakeRotation(-3.14159/2);
     
     [self gyroRotateOutput];
         timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(reduceTime) userInfo:nil repeats:YES];
}

- (IBAction)backPressed
{ 
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)reduceTime
{
    progress.value = progress.value- 0.005;
    NSLog(@"Progress = %f", progress.value);
    if (progress.value >= 0.99) {
        [timer invalidate];
         [UIView animateWithDuration:2 animations:^{
             charactor.image = [UIImage imageNamed:@"001b.png"];
             
          }completion:^(BOOL finished) {
              
          }];
    }
}

- (IBAction)switchPressed1 {
    charactor.image = [UIImage imageNamed:@"001b.png"];
}

- (IBAction)switchPressed {
    charactor.image = [UIImage imageNamed:@"doutai.png"];
}

- (void)gyroRotateOutput {
    motionManager = [[CMMotionManager alloc] init];
    
    if (motionManager.gyroAvailable) {
        //     NSLog(@"gyroAvailable");
        //   motionManager.gyroUpdateInterval = 1.0/60.0;
        
        motionManager.gyroUpdateInterval = 5.0/60.0;
        
        [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                   withHandler: ^(CMGyroData *gyroData, NSError *error)
         {
             // CMRotationRate rotate = gyroData.rotationRate;
             [self iGyro];
             
             /*
              NSLog(@"rotation rate = [%f, %f, %f]", rotate.x, rotate.y, rotate.z);
              
              double x = (sqrt(sqrt(pow(rotate.x,2))*10))*80;
              double y = (sqrt(sqrt(pow(rotate.y,2))*10))*80;;
              double z = (sqrt(sqrt(pow(rotate.z,2))*10))*80;;
              double t = x+y+z;
              //  NSLog(@"++++t =  [%f]", t);
              audioController.f = t;
              
              [audioController changeFreq]; */
             //
             // self.audioController = nil;
             //  [audioController stopAUGraph];
             //  [audioController initializeAUGraph];
             //  [audioController startAUGraph];
             
         }];
        
    } else {
        //      NSLog(@"No gyroscope on device.");
        gyro = 1;
        
        accel = [UIAccelerometer sharedAccelerometer];
        accel.delegate = self;
        accel.updateInterval = 5.0f/60.0f;
    }
    
}

-(void) iGyro {
    motionManager.gyroUpdateInterval = 5.0/60.0;
    
    [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                               withHandler: ^(CMGyroData *gyroData, NSError *error)
     {
         CMRotationRate rotate = gyroData.rotationRate;
         
         
         //      NSLog(@"rotation rate = [%f, %f, %f]", rotate.x, rotate.y, rotate.z);
         
         double x = (sqrt(sqrt(pow(rotate.x,2))*10));
         double y = (sqrt(sqrt(pow(rotate.y,2))*10));
         double z = (sqrt(sqrt(pow(rotate.z,2))*10));
         double t = x+y+z;
         //     NSLog(@"Gyro++++t =  [%f]", t);
        if (t>15) {
             progress.value = progress.value + t/2000;
         NSLog(@"Progress = %f", progress.value);
         //    audioController.f = t;
          //   if (isOn == 0) {
           //      isOn = 1;
           //      [audioController initializeAUGraph];
            //     [audioController startAUGraph];
           //  }
           //  [audioController changeFreq];
       //  } else {
         //    isOn = 0;
          //   [audioController stopAUGraph];
             //         NSLog(@"t<550 Gyro++++t =  [%f]", t);
        }
         
         
         //  audioController.f = t;
         
         //  [audioController changeFreq];
     }
     ];
}

- (void)accelerometer:(UIAccelerometer *)acel didAccelerate:(UIAcceleration *)acceleration
{
    
    double x = (sqrt(sqrt(pow(acceleration.x,2))*30))*80;
    double y = (sqrt(sqrt(pow(acceleration.y,2))*30))*80;
    double z = (sqrt(sqrt(pow(acceleration.z,2))*30))*80;
    double t = x+y+z;
    if (t>750) {
     //   audioController.f = t;
       // if (isOn == 0) {
        //    isOn = 1;
          //  [audioController initializeAUGraph];
         //   [audioController startAUGraph];
      //  }
       // [audioController changeFreq];
    } else {
      //  isOn = 0;
      //  [audioController stopAUGraph];
    }
    //     NSLog(@"++++f =  [%f]", audioController.f);
    //   NSLog(@"Mx: %g, My: %g, Mz:%g", acceleration.x, acceleration.y, acceleration.z);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
