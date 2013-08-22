//
//  FanViewController.m
//  iFan
//
//  Created by Arun Joseph on 8/20/13.
//  Copyright (c) 2013 Arun Joseph. All rights reserved.
//

#import "FanViewController.h"

@interface FanViewController ()

@end

@implementation FanViewController
@synthesize mysetting;
@synthesize mybuttonhigh;
@synthesize mybuttonlow;
@synthesize mybuttonoff;

-  (void)myButtonClickHigh:(id)sender {
    mysetting.text = @"High";
}
-  (void)myButtonClickLow:(id)sender {
    mysetting.text = @"Low";
}
-  (void)myButtonClickOff:(id)sender {
    mysetting.text = @"Off";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mysetting.text = @"Off";
    
    [mybuttonhigh setTitle:@"High" forState: (UIControlState)UIControlStateNormal];
    [mybuttonhigh addTarget:self
                    action:@selector(myButtonClickHigh:)
                    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    [mybuttonlow setTitle:@"Low" forState: (UIControlState)UIControlStateNormal];
    [mybuttonlow addTarget:self
                    action:@selector(myButtonClickLow:)
                    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    [mybuttonoff setTitle:@"Off" forState: (UIControlState)UIControlStateNormal];
    [mybuttonoff addTarget:self
                    action:@selector(myButtonClickOff:)
                    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];

    	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
