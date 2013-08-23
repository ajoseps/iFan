//
//  main.m
//  iFan
//
//  Created by Arun Joseph on 8/20/13.
//  Copyright (c) 2013 Arun Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FanAppDelegate.h"
#import "NUISettings.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        [NUISettings init];
        [NUISettings setAutoUpdatePath:@"/Users/arun/Documents/Volt.ly/iFan/iFan/NUI/NUIStyle.nss"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([FanAppDelegate class]));
    }
}
