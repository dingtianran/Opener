//
//  BgTileView.m
//  HuadaTV
//
//  Created by dingtr on 11-4-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BgTileView.h"


@implementation BgTileView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
        self.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	UIImage *bgImg = [UIImage imageNamed:@"bg"];
	[bgImg drawAsPatternInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
