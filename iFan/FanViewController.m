//
//  FanViewController.m
//  iFan
//
//  Created by Arun Joseph on 8/20/13.
//  Copyright (c) 2013 Arun Joseph. All rights reserved.
//

#import "FanViewController.h"
#import "Base64.h"

@interface FanViewController ()

@end

@implementation FanViewController
@synthesize mysetting;
@synthesize mybuttonhigh;
@synthesize mybuttonlow;
@synthesize mybuttonoff;


-  (void)jsonRequest: (int) req{
    
    // Authorization Header
    NSString *accountID = @"5534b9b1-3813-5ed5-054b-7460cd818bee";
    NSString *password = @"f804f69a16e777a21948e9521a21eb90";
    NSString *userPass = [NSString stringWithFormat: @"%@:%@", accountID, password];
    NSString *encodedUserPass = [userPass base64EncodedString];
    NSString *authHeader = [NSString stringWithFormat: @" Basic %@", encodedUserPass];
    
    // Inserts URL
    NSURL *url = [NSURL URLWithString:@"https://api.volt.ly/v1/digital_write"];
    NSMutableURLRequest *request1 = [[NSMutableURLRequest alloc] initWithURL:url];
    NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // Request Data
    NSNumber *value1;
    NSNumber *value2;
    
    switch(req){
        case 2:
            value1 = [NSNumber numberWithInteger: 1];
            value2 = [NSNumber numberWithInteger: 1];
            break;
        case 1:
            value1 = [NSNumber numberWithInteger: 1];
            value2 = [NSNumber numberWithInteger: 0];
            break;
        default:
            value1 = [NSNumber numberWithInteger: 0];
            value2 = [NSNumber numberWithInteger: 0];
    }

    NSDictionary *tmp1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                         @"3", @"Pin",
                         value1, @"Value",
                         @"Default", @"Tag",
                         nil];
    NSDictionary *tmp2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"2", @"Pin",
                          value2, @"Value",
                          @"Default", @"Tag",
                          nil];
    NSError *error;
    NSData *postdata1 = [NSJSONSerialization dataWithJSONObject:tmp1 options:0 error:&error];
    NSData *postdata2 = [NSJSONSerialization dataWithJSONObject:tmp2 options:0 error:&error];
    
    // Setting Fields
    [request1 setHTTPBody:postdata1];
    [request1 setHTTPMethod:@"POST"];
    [request1 setValue: authHeader forHTTPHeaderField:@"Authorization"];
    [request1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request1 setValue:[NSString stringWithFormat:@"%d", [postdata1 length]] forHTTPHeaderField:@"Content-Length"];
    
    [request2 setHTTPBody:postdata2];
    [request2 setHTTPMethod:@"POST"];
    [request2 setValue: authHeader forHTTPHeaderField:@"Authorization"];
    [request2 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request2 setValue:[NSString stringWithFormat:@"%d", [postdata2 length]] forHTTPHeaderField:@"Content-Length"];
    
    // Send Requests
    [NSURLConnection connectionWithRequest:request1 delegate:self];
    [NSURLConnection connectionWithRequest:request2 delegate:self];
    }

-  (void)myButtonClickHigh:(id)sender {
    mysetting.text = @"High";
    [self jsonRequest: 2];
}
-  (void)myButtonClickLow:(id)sender {
    mysetting.text = @"Low";
    [self jsonRequest: 1];
}
-  (void)myButtonClickOff:(id)sender {
    mysetting.text = @"Off";
    [self jsonRequest: 0];
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
