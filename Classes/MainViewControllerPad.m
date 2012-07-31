//
//  MainViewControllerPad.m
//  Opener
//
//  Created by tianran DING on 12-1-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewControllerPad.h"
#import "BgTileView.h"
#import "MKInfoPanel.h"
#import "AppDelegate_Pad.h"
#import "InputView.h"
#import "InfoView.h"

@implementation MainViewControllerPad
@synthesize appID = _appID;


- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
        self.appID = nil;
        
    }
    return self;
}

- (void) dealloc {
    [_appID release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void) openButtonPressed:(id)sender {
    [_inputView dismissKeyboard];
    self.appID = [NSString stringWithFormat:@"%@",_inputView.idField.text];
    if ([self.appID length]<1) {//id长度为0
        
        [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeError title:@"提示" subtitle:@"请输入完整 App ID" hideAfter:1];
        return;
    }
    if ([self.appID intValue]<1) {//含奇怪字符
        
        [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeError title:@"提示" subtitle:@"请输入合理的 App ID" hideAfter:1];
        return;
    }
    
    NSString *appUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?mt=8", self.appID];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appUrl]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
    }
    
}

- (void) infoButtonPressed:(id)sender {
    if (_infoView == nil) {
        [_inputView dismissKeyboard];
        _blackMask = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info-mask"]] autorelease];
        _blackMask.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        _blackMask.frame = self.view.bounds;
        _blackMask.alpha = 0.0;
        _blackMask.userInteractionEnabled = NO;
        [self.view addSubview:_blackMask];
        
        _infoView = [[[InfoView alloc] initForPad] autorelease];
        _infoView.hostController = self;
        _infoView.transform = CGAffineTransformMakeRotation(-M_PI/6);
        _infoView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height+500);
        [self.view addSubview:_infoView];
    }
    
    [UIView commitAnimations];
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         _blackMask.alpha = 1.0;
                         _infoView.transform = CGAffineTransformMakeRotation(0);
                         _infoView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
                     }
                     completion:nil];
    
}

- (void) infoCloseButtonPressed {
    if (_infoView!=nil) {
        
        [UIView animateWithDuration:0.5f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             _blackMask.alpha = 0.0;
                             _infoView.transform = CGAffineTransformMakeRotation(-M_PI/6);
                             _infoView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height +500.0);
                         }
                         completion:^(BOOL finished) {
                             [_infoView removeFromSuperview];
                             _infoView = nil;
                             [_blackMask removeFromSuperview];
                             _blackMask = nil;
                         }];
        
    }
    
    
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    _inputView = [[[InputView alloc] initWithFrame:CGRectMake(0, 0, 600, 90)] autorelease];
    _inputView.hostController = self;
    _inputView.center = CGPointMake(self.view.frame.size.width * 0.5, 240);
    [self.view addSubview:_inputView];
    
    _openButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _openButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin);
    _openButton.frame = CGRectMake(0, 0, 206, 206);
    _openButton.center = CGPointMake(self.view.frame.size.width * 0.5, 500);
    UIImage *stretchImg = [[UIImage imageNamed:@"gobtn"] resizableImageWithCapInsets:UIEdgeInsetsMake(51, 51, 51, 51)];
    [_openButton setBackgroundImage:stretchImg forState:UIControlStateNormal];
    _openButton.titleLabel.font = [UIFont boldSystemFontOfSize:40];
    [_openButton setTitle:@"Open" forState:UIControlStateNormal];
    [_openButton addTarget:self action:@selector(openButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_openButton];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoButton.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin);
    infoButton.center = CGPointMake(self.view.frame.size.width-50, self.view.frame.size.height-50);
    [infoButton addTarget:self action:@selector(infoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
