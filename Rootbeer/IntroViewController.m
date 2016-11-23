//
//  IntroViewController.m
//  Rootbeer
//
//  Created by Jean-Jean Wei on 13-01-19.
//  Copyright (c) 2013 Ice Whale. All rights reserved.
//

#import "IntroViewController.h"
#import "MenuViewController.h"

@implementation IntroViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAlphaToZero];
    
    [UIView animateWithDuration:2 animations:^{
        layer0.alpha = 1;
        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            layer1.alpha = 1;
            timer_touch = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(showTouch) userInfo:nil repeats:YES];
        }completion:^(BOOL finished) {
            
        }];
    }];
}
- (void)showTouch
{
    [UIView animateWithDuration:1 animations:^{
        btnClickHere.frame	= CGRectOffset(btnClickHere.frame, 0, -10);
         btnClickHere.alpha = 1;
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            btnClickHere.alpha = 0;
            btnClickHere.frame	= CGRectOffset(btnClickHere.frame, 0, 10);
        }completion:^(BOOL finished) {
            
        }];
    }];
   
}

- (IBAction)clickHerePressed
{
    MenuViewController *menuViewController = [MenuViewController new];
    [self.navigationController pushViewController:menuViewController animated:NO];
}
- (void)setAlphaToZero
{
    layer0.alpha = 0;
    layer1.alpha = 0;
    btnClickHere.alpha = 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
