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

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)


@implementation FBMainButton
{
    BOOL buttonPressed;
	int totalNrButtons;
}


#pragma mark - init
#pragma mark

- (instancetype)initWithFrame:(CGRect)frame andButtons:(int)nrButtons
{
	self = [super initWithFrame:frame];
	if (self)
	{
		totalNrButtons = nrButtons;
		self.backgroundColor = [UIColor blueColor];
		self.layer.cornerRadius = frame.size.width/2;
		self.layer.borderColor = [UIColor whiteColor].CGColor;
		self.layer.borderWidth = BORDER_WIDTH;
		
		self.arrayOfButtons = [NSMutableArray new];
        
        buttonPressed = NO;
		
		//ADD PLUS VIEW
		[self addPlusView];
		[self addChildButtonWithFrame:CGRectMake(xPosition + 5, yPosition + 5, WIDTH - 10, HEIGHT - 10) andImage:nil];
		
	}
	return self;
}

- (void)addPlusView
{
	plusView = [[FBPLusView alloc] initWithFrame: CGRectMake(xPosition + BORDER_WIDTH, yPosition + BORDER_WIDTH, WIDTH - BORDER_WIDTH*2, HEIGHT - BORDER_WIDTH*2)];
	
    //ADD GESTURE
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonSelected)];
	tapGesture.numberOfTapsRequired = 1;
	tapGesture.numberOfTouchesRequired = 1;
	[plusView addGestureRecognizer:tapGesture];
	
	[self addSubview:plusView];
}

- (void)addChildButtonWithFrame:(CGRect)frame  andImage:(UIImage*)buttonImage
{
	childButtonFrame = frame;
	
	for (int i = 0; i < totalNrButtons; i++)
	{
	  {
		UIButton *button = [[UIButton alloc] initWithFrame:frame];
		button.layer.cornerRadius = frame.size.width/2;
		button.backgroundColor = [UIColor blueColor];
		[self addSubview:button];
		[self sendSubviewToBack:button];
		[self.arrayOfButtons addObject:button];
	  }
	}
	
}


#pragma mark - Actions And Animation
#pragma mark

- (void)buttonSelected
{
    static int imgAngle = 0;
    
   if (!buttonPressed)
   {
       buttonPressed = YES;
       
       CABasicAnimation *animation = [CABasicAnimation   animationWithKeyPath:@"transform.rotation.z"];
       animation.duration = 0.15;
       animation.additive = YES;
       animation.removedOnCompletion = NO;
       animation.fillMode = kCAFillModeForwards;
       animation.fromValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(imgAngle)];
       animation.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(imgAngle+130)];
       [plusView.layer addAnimation:animation forKey:@"rotation"];

	   
	   [self animateRiseUpChildButtons:YES];

   }
    else if (buttonPressed)
    {
        buttonPressed = NO;
        
        CABasicAnimation *animation = [CABasicAnimation   animationWithKeyPath:@"transform.rotation.z"];
        animation.duration = 0.15;
        animation.additive = YES;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(imgAngle+130)];
        animation.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(imgAngle)];
        [plusView.layer addAnimation:animation forKey:@"rotation"];
		
		[self animateRiseUpChildButtons:NO];

    }
}

- (void)animateRiseUpChildButtons:(BOOL)riseUp
{
	if (riseUp)
	{
		 [self.arrayOfButtons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
			 
			 [UIView animateWithDuration:0.5
								   delay:0
				  usingSpringWithDamping:0.4
				   initialSpringVelocity:0
								 options:UIViewAnimationOptionCurveLinear
							  animations:^{
				 
				 [button setFrame:CGRectMake(childButtonFrame.origin.x,
											 childButtonFrame.origin.y - ((20+childButtonFrame.size.width) * (idx+1)),
											 childButtonFrame.size.width,
											 childButtonFrame.size.height)];
			 } completion:nil];
		 }];
	}
	
	
	if (!riseUp)
	{
		[self.arrayOfButtons enumerateObjectsWithOptions:NSEnumerationReverse
											  usingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {

			  [UIView animateWithDuration:0.5
									delay:0
				   usingSpringWithDamping:1
					initialSpringVelocity:0
								  options:UIViewAnimationOptionCurveLinear
							   animations:^{
				  
					[button setFrame:CGRectMake(xPosition + 5, yPosition + 5, WIDTH - 10, HEIGHT - 10)];
			  } completion:nil];
												  
	  }];
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
