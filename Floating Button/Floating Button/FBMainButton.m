//
//  FBMainButton.m
//  Floating Button
//
//  Created by winify on 3/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

#import "FBMainButton.h"

#define WIDTH self.bounds.size.width
#define HEIGHT self.bounds.size.height
#define xPosition self.bounds.origin.x
#define yPosition self.bounds.origin.y
#define BORDER_WIDTH 3


@implementation FBMainButton

#pragma mark - init
#pragma mark

- (instancetype)initWithFrame:(CGRect)frame andButtons:(int)totalNrButtons
{
	self = [super initWithFrame:frame];
	if (self)
	{
		self.backgroundColor = [UIColor blueColor];
		self.layer.cornerRadius = frame.size.width/2;
		self.layer.borderColor = [UIColor whiteColor].CGColor;
		self.layer.borderWidth = BORDER_WIDTH;
		
		NSLog(@"MainButton");
		NSLog(@"x = %f",self.frame.origin.x);
		NSLog(@"y = %f",self.frame.origin.y);
		NSLog(@"width = %f",self.bounds.size.width);
		NSLog(@"height = %f",self.bounds.size.height);
		
		//ADD PLUS VIEW
		[self addPlusView];
		
		
	}
	return self;
}

- (void)addPlusView
{
	FBPLusView *plusView = [[FBPLusView alloc] initWithFrame: CGRectMake(xPosition + BORDER_WIDTH, yPosition + BORDER_WIDTH, WIDTH - BORDER_WIDTH*2, HEIGHT - BORDER_WIDTH*2)];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonSelected)];
	tapGesture.numberOfTapsRequired = 1;
	tapGesture.numberOfTouchesRequired = 1;
	[plusView addGestureRecognizer:tapGesture];
	
	[self addSubview:plusView];
}

- (UIButton*)addChildButtonWithFrame:(CGRect)frame  andImage:(UIImage*)buttonImage
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	button.layer.cornerRadius = frame.size.width/2;
	

	return button;
}


#pragma mark - Actions
#pragma mark

- (void)buttonSelected
{
	

	
	
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
