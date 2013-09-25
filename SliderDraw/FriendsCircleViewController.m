//
//  FriendsCircleViewController.m
//  SliderDraw
//
//  Created by Sinosoft on 9/23/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import "FriendsCircleViewController.h"

@interface FriendsCircleViewController ()

@end

@implementation FriendsCircleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"朋友圈";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor
                                                           colorWithRed:78.0/255.0
                                                           green:156.0/255.0
                                                           blue:206.0/255.0
                                                           alpha:1.0]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
