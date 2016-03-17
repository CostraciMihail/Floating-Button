//
//  ViewController.m
//  Floating Button
//
//  Created by winify on 3/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

#import "ViewController.h"

#define BUTTON_WIDTH 80
#define BUTTON_HEIGHT 80


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	FBMainButton *mainButton =
	[[FBMainButton alloc] initWithFrame:
						CGRectMake([UIScreen mainScreen].bounds.size.width/2 - BUTTON_WIDTH/2,
								  [UIScreen mainScreen].bounds.size.height/2 - BUTTON_WIDTH/2,
																			   BUTTON_WIDTH,
																			   BUTTON_WIDTH)
																			  andButtons:2];
	
	[self.view addSubview:mainButton];


}









- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
