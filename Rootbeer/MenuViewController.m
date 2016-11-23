//
//  MenuViewController.m
//  Rootbeer
//
//  Created by Jean-Jean Wei on 12-11-19.
//  Copyright (c) 2012 Jean-Jean Wei. All rights reserved.
//

#import "MenuViewController.h"
#import "ShakeViewController.h"
#import "SettingsViewController.h"

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (IBAction)startPressed
{
    ShakeViewController *shakeViewController = [ShakeViewController new];
    [self.navigationController pushViewController:shakeViewController animated:YES];
}

- (IBAction)settingsPressed
{
    SettingsViewController *settingsViewController = [SettingsViewController new];
    [self.navigationController pushViewController:settingsViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
