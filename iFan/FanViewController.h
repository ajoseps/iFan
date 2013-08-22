//
//  FanViewController.h
//  iFan
//
//  Created by Arun Joseph on 8/20/13.
//  Copyright (c) 2013 Arun Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FanViewController : UIViewController {
    IBOutlet UILabel *mysetting;
    IBOutlet UIButton *mybuttonhigh;
    IBOutlet UIButton *mybuttonlow;
    IBOutlet UIButton *mybuttonoff;
}
@property (nonatomic) UILabel *mysetting;
@property (nonatomic) UIButton *mybuttonhigh;
@property (nonatomic) UIButton *mybuttonlow;
@property (nonatomic) UIButton *mybuttonoff;


@end
