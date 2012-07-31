//
//  InfoView.m
//  Opener
//
//  Created by tianran DING on 12-1-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InfoView.h"
#import "AppDelegate_Phone.h"
#import "MainViewControllerPad.h"

@implementation InfoView
@synthesize hostController = _hostController;

- (id)initForPhone
{
    self = [super initWithFrame:CGRectMake(0, 0, 260, 360)];
    if (self) {
        // Initialization code
        UIImage *tileImg = [[UIImage imageNamed:@"info-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(51, 20, 51, 20)];
        _tileBg = [[UIImageView alloc] initWithImage:tileImg];
        _tileBg.frame = self.bounds;
        [self addSubview:_tileBg];
        [_tileBg release];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake(0, 0, 30, 29);
        button.center = CGPointMake(227, 33);
        [button setImage:[UIImage imageNamed:@"close-button"] forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = YES;
        [button addTarget:self action:@selector(phoneCloseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 180, 40)];
        title.text = @"Opener";
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont boldSystemFontOfSize:30];
        [self addSubview:title];
        [title release];
        
        UILabel *ver = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 80, 40)];
        ver.text = @"v1.0";
        ver.textColor = [UIColor whiteColor];
        ver.backgroundColor = [UIColor clearColor];
        ver.font = [UIFont systemFontOfSize:24];
        [self addSubview:ver];
        [ver release];
        
        UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(40, 130, 180, 50)];
        desc.numberOfLines = 0;
        desc.text = @"Design & code:\nDingtianran";
        desc.textColor = [UIColor whiteColor];
        desc.backgroundColor = [UIColor clearColor];
        desc.font = [UIFont systemFontOfSize:20];
        [self addSubview:desc];
        [desc release];
        
        UILabel *contact = [[UILabel alloc] initWithFrame:CGRectMake(40, 190, 180, 25)];
        contact.text = @"Contact me:";
        contact.textColor = [UIColor whiteColor];
        contact.backgroundColor = [UIColor clearColor];
        contact.font = [UIFont systemFontOfSize:20];
        [self addSubview:contact];
        [contact release];
        
        UILabel *dingtr = [[UILabel alloc] initWithFrame:CGRectMake(40, 210, 200, 25)];
        dingtr.adjustsFontSizeToFitWidth = YES;
        dingtr.text = @"http://www.dingtianran.com";
        dingtr.textColor = [UIColor whiteColor];
        dingtr.backgroundColor = [UIColor clearColor];
        dingtr.font = [UIFont systemFontOfSize:20];
        [self addSubview:dingtr];
        [dingtr release];
        
    }
    return self;
}

- (id)initForPad
{
    self = [super initWithFrame:CGRectMake(0, 0, 400, 600)];
    if (self) {
        // Initialization code
        self.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin);
        
        UIImage *tileImg = [[UIImage imageNamed:@"info-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(51, 20, 51, 20)];
        _tileBg = [[[UIImageView alloc] initWithImage:tileImg] autorelease];
        _tileBg.frame = self.bounds;
        [self addSubview:_tileBg];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake(0, 0, 60, 58);
        button.center = CGPointMake(self.frame.size.width-60, 60);
        [button setImage:[UIImage imageNamed:@"close-button"] forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = YES;
        [button addTarget:self action:@selector(padCloseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UILabel *title = [[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 300, 60)] autorelease];
        title.text = @"Opener";
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont boldSystemFontOfSize:50];
        [self addSubview:title];
        
        UILabel *ver = [[[UILabel alloc] initWithFrame:CGRectMake(40, 120, 200, 50)] autorelease];
        ver.text = @"v1.0";
        ver.textColor = [UIColor whiteColor];
        ver.backgroundColor = [UIColor clearColor];
        ver.font = [UIFont systemFontOfSize:40];
        [self addSubview:ver];
        
        UILabel *desc = [[[UILabel alloc] initWithFrame:CGRectMake(40, 180, 350, 90)] autorelease];
        desc.numberOfLines = 0;
        desc.text = @"Design & code:\nDingtianran";
        desc.textColor = [UIColor whiteColor];
        desc.backgroundColor = [UIColor clearColor];
        desc.font = [UIFont systemFontOfSize:40];
        [self addSubview:desc];
        
        UILabel *contact = [[UILabel alloc] initWithFrame:CGRectMake(40, 270, 300, 50)];
        contact.text = @"Contact me:";
        contact.textColor = [UIColor whiteColor];
        contact.backgroundColor = [UIColor clearColor];
        contact.font = [UIFont systemFontOfSize:40];
        [self addSubview:contact];
        [contact release];
        
        UILabel *dingtr = [[[UILabel alloc] initWithFrame:CGRectMake(40, 320, 320, 50)] autorelease];
        dingtr.adjustsFontSizeToFitWidth = YES;
        dingtr.text = @"http://www.dingtianran.com";
        dingtr.textColor = [UIColor whiteColor];
        dingtr.backgroundColor = [UIColor clearColor];
        dingtr.font = [UIFont systemFontOfSize:30];
        [self addSubview:dingtr];
    }
    return self;
}

- (void) phoneCloseButtonPressed:(id)sender {
    AppDelegate_Phone *appDelegate = (AppDelegate_Phone*)[UIApplication sharedApplication].delegate;
    [appDelegate hideInfoView];
    
}

- (void) padCloseButtonPressed:(id)sender {
    MainViewControllerPad * padCon = (MainViewControllerPad*)self.hostController;
    [padCon infoCloseButtonPressed];
    
    
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
