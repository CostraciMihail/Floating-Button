//
//  FBPLusView.m
//  Floating Button
//
//  Created by winify on 3/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

#import "FBPLusView.h"


#define xPosition self.bounds.origin.x
#define yPosition self.bounds.origin.y
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define FREE_SPACE 10
#define HEIGHT_PLUS 5


@implementation FBPLusView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		self.layer.cornerRadius = frame.size.width/2;
		self.backgroundColor = [UIColor blueColor];
		self.alpha = 0.7;

		[self addPlusView];
		
	}
	
	return self;
}

- (void)addPlusView
{
	[self addSubview:[self addHorizontalLine]];
	[self addSubview:[self addVerticalLine]];
	
}

- (UIView*)addHorizontalLine
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xPosition + FREE_SPACE, yPosition + (WIDTH/2 - HEIGHT_PLUS/2), WIDTH - FREE_SPACE*2, HEIGHT_PLUS)];
	view.backgroundColor = [UIColor whiteColor];
	view.layer.cornerRadius = 3;
	
	return view;
}

- (UIView*)addVerticalLine
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(xPosition + (WIDTH/2 - HEIGHT_PLUS/2), yPosition + FREE_SPACE, HEIGHT_PLUS, WIDTH - FREE_SPACE*2)];
	view.backgroundColor = [UIColor whiteColor];
	view.layer.cornerRadius = 3;

	return view;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
