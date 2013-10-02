//
//  FanViewController.m
//  iFan
//
//  Created by Arun Joseph on 8/20/13.
//  Copyright (c) 2013 Arun Joseph. All rights reserved.
//

#import "FanViewController.h"
#import "Base64.h"
#import "UIButton+NUI.h"

@interface FanViewController ()

@end

@implementation FanViewController
@synthesize mysetting;
@synthesize mybuttonhigh;
@synthesize mybuttonlow;
@synthesize mybuttonoff;

-  (void)jsonWriteRequest: (int) req{
    
    // Authorization Header
    NSString *accountID = @"5534b9b1-3813-5ed5-054b-7460cd818bee";
    NSString *password = @"f804f69a16e777a21948e9521a21eb90";
    NSString *userPass = [NSString stringWithFormat: @"%@:%@", accountID, password];
    NSString *encodedUserPass = [userPass base64EncodedString];
    NSString *authHeader = [NSString stringWithFormat: @" Basic %@", encodedUserPass];
    
    // Inserts URL
    NSURL *url = [NSURL URLWithString:@"https://api.volt.ly/v1/digital-write"];
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

-  (void)jsonReadRequest{
    
    // Authorization Header
    NSString *accountID = @"5534b9b1-3813-5ed5-054b-7460cd818bee";
    NSString *password = @"f804f69a16e777a21948e9521a21eb90";
    NSString *userPass = [NSString stringWithFormat: @"%@:%@", accountID, password];
    NSString *encodedUserPass = [userPass base64EncodedString];
    NSString *authHeader = [NSString stringWithFormat: @" Basic %@", encodedUserPass];
    
    // Inserts URL
    NSURL *url = [NSURL URLWithString:@"https://api.volt.ly/v1/digital-read"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // Request Data
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"A0", @"Pin",
                          @"Default", @"Tag",
                          nil];
    NSError *error;
    NSData *postdata1 = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
    
    // Setting Fields
    [request setHTTPBody:postdata1];
    [request setHTTPMethod:@"POST"];
    [request setValue: authHeader forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [postdata1 length]] forHTTPHeaderField:@"Content-Length"];
    
    NSHTTPURLResponse *response;
    // Send Requests
    [NSURLConnection connectionWithRequest:request delegate:self];
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dictionary = [response allHeaderFields];
        NSLog([dictionary description]);
    }
}


-  (void)myButtonClickHigh:(id)sender {
    mysetting.text = @"High";
    [self jsonReadRequest];
}
-  (void)myButtonClickLow:(id)sender {
    mysetting.text = @"Low";
    [self jsonReadRequest];
}
-  (void)myButtonClickOff:(id)sender {
    mysetting.text = @"Off";
    [self jsonReadRequest];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mysetting.text = @"Off";
    
    mybuttonhigh.nuiClass = @"Button:HighButton";
    [mybuttonhigh setTitle:@"High" forState: (UIControlState)UIControlStateNormal];
    [mybuttonhigh addTarget:self
                    action:@selector(myButtonClickHigh:)
                    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    mybuttonlow.nuiClass = @"Button:LowButton";
    [mybuttonlow setTitle:@"Low" forState: (UIControlState)UIControlStateNormal];
    [mybuttonlow addTarget:self
                    action:@selector(myButtonClickLow:)
                    forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    
    mybuttonoff.nuiClass = @"Button:OffButton";
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
