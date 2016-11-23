//
//  SettingsViewController.m
//  Rootbeer
//
//  Created by Jean-Jean Wei on 13-01-16.
//  Copyright (c) 2013 Jean-Jean Wei. All rights reserved.
//

#import "SettingsViewController.h"
#import "CreditViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)creditsPressed
{
    CreditViewController *creditViewController = [CreditViewController new];
    [self.navigationController pushViewController:creditViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
