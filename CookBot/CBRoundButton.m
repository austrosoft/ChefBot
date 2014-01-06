//
//  CBRoundButton.m
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import "CBRoundButton.h"

@implementation CBRoundButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES; //fill with color
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
