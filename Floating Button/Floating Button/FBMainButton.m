//
//  FBMainButton.m
//  Floating Button
//
//  Created by winify on 3/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

#import "FBMainButton.h"

@implementation FBMainButton

- (instancetype)initWithFrame:(CGRect)frame andButtons:(int)totalNrButtons
{
	self = [super initWithFrame:frame];
	if (self)
	{
		self.backgroundColor = [UIColor blueColor];
		self.layer.cornerRadius = frame.size.width/2;
		self.layer.borderColor = [UIColor whiteColor].CGColor;
		self.layer.borderWidth = 2;
		
	}
	return self;
}

- (UIButton*)addChildButtonWithFrame:(CGRect)frame  andImage:(UIImage*)buttonImage
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	button.layer.cornerRadius = frame.size.width/2;
	

	return button;
}

//- (CALayer*)createLayer


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
