//
//  FBMainButton.h
//  Floating Button
//
//  Created by winify on 3/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBMainButton : UIButton


@property (nonatomic, strong) NSMutableArray *arrayOfButtons;


- (instancetype)initWithFrame:(CGRect)frame andButtons:(int)totalNrButtons;

@end
