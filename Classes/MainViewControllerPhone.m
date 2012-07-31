//
//  MainViewControllerPhone.m
//  Opener
//
//  Created by tianran DING on 12-1-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewControllerPhone.h"
#import "BgTileView.h"
#import "MKInfoPanel.h"
#import "AppDelegate_Phone.h"

@implementation MainViewControllerPhone

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) openButtonPressed:(id)sender {
    if (self.view.frame.origin.y<0) {
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             self.view.transform = CGAffineTransformMakeTranslation(0, 0);
                         }
                         completion:nil];
    }
    if ([_idField isFirstResponder]) {
        [_idField resignFirstResponder];
    }
    
    if ([_idField.text length]<1) {//id长度为0
        [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeError title:@"提示" subtitle:@"请输入完整App ID" hideAfter:1];
        return;
    }
    if ([_idField.text intValue]<1) {//含奇怪字符
        [MKInfoPanel showPanelInView:self.view type:MKInfoPanelTypeError title:@"提示" subtitle:@"请输入正确App ID" hideAfter:1];
        return;
    }
    NSString *appUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?mt=8",_idField.text];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appUrl]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
    }
    
}

- (void) infoButtonPressed:(id)sender {
    AppDelegate_Phone *appDelegate = (AppDelegate_Phone*)[UIApplication sharedApplication].delegate;
    [appDelegate showInfoView];
    
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    _bgView = [[BgTileView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_bgView];
    [_bgView release];
    
    UIImage *stretchImg = [[UIImage imageNamed:@"fieldBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(22, 10, 22, 10)];
    UIImageView *fieldBg = [[UIImageView alloc] initWithImage:stretchImg];
    fieldBg.frame = CGRectMake(-7, 100, 307, 45);
    [self.view addSubview:fieldBg];
    [fieldBg release];
    
    leftHalfLabel = [[UILabel alloc] initWithFrame:CGRectMake(-10, 100, 143, 45)];
    leftHalfLabel.font = [UIFont boldSystemFontOfSize:20];
    leftHalfLabel.backgroundColor = [UIColor clearColor];
    leftHalfLabel.textColor = [UIColor darkGrayColor];
    leftHalfLabel.text = @"ple.com/app/id";
    leftHalfLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:leftHalfLabel];
    [leftHalfLabel release];
    
    _idField = [[[UITextField alloc] initWithFrame:CGRectMake(leftHalfLabel.frame.origin.x+leftHalfLabel.frame.size.width, 101, 105, 45)] autorelease];
    _idField.delegate = self;
    _idField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _idField.autocorrectionType = UITextAutocorrectionTypeNo;
    _idField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _idField.returnKeyType = UIReturnKeyDone;
    _idField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _idField.font = [UIFont boldSystemFontOfSize:20];
    _idField.textColor = [UIColor blackColor];
    _idField.text = @"";
    _idField.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:_idField];
    
    UIImage *scretchImg = [[UIImage imageNamed:@"scretchCircle.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:3];
    grayRectImg = [[[UIImageView alloc] initWithImage:scretchImg] autorelease];
    grayRectImg.frame = CGRectMake(_idField.frame.origin.x, _idField.frame.origin.y+5, _idField.frame.size.width, _idField.frame.size.height-10);
    [self.view addSubview:grayRectImg];
    
    rightHalfLabel = [[[UILabel alloc] initWithFrame:CGRectMake(grayRectImg.frame.origin.x+grayRectImg.frame.size.width, 100, 80, 45)] autorelease];
    rightHalfLabel.font = [UIFont boldSystemFontOfSize:20];
    rightHalfLabel.backgroundColor = [UIColor clearColor];
    rightHalfLabel.textColor = [UIColor darkGrayColor];
    rightHalfLabel.text = @"?mt=8";
    [self.view addSubview:rightHalfLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 103, 103);
    button.center = CGPointMake(160, 230);
    [button setBackgroundImage:[UIImage imageNamed:@"gobtn.png"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [button setTitle:@"Open" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoButton.center = CGPointMake(300, 440);
    [infoButton addTarget:self action:@selector(infoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark uitextfielddelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.view.frame.origin.y > -1) {
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             self.view.transform = CGAffineTransformMakeTranslation(0, -50.0f);
                         }
                         completion:nil];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.view.frame.origin.y<0) {
        [UIView animateWithDuration:0.3f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             self.view.transform = CGAffineTransformMakeTranslation(0, 0);
                         }
                         completion:nil];
    }
    
    [textField resignFirstResponder];
    return YES;
    
}

@end
