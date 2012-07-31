//
//  InputView.m
//  Opener
//
//  Created by tianran DING on 12-1-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InputView.h"

@implementation InputView
@synthesize hostController = _hostController;
@synthesize idField = _idField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = (UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin);
        UIImage *stretchImg = [[UIImage imageNamed:@"fieldBg"] resizableImageWithCapInsets:UIEdgeInsetsMake(22, 10, 22, 10)];
        UIImageView *fieldBg = [[[UIImageView alloc] initWithImage:stretchImg] autorelease];
        fieldBg.frame = self.bounds;
        [self addSubview:fieldBg];
        
        leftHalfLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 5, 363, 80)] autorelease];
        leftHalfLabel.font = [UIFont boldSystemFontOfSize:25];
        leftHalfLabel.backgroundColor = [UIColor clearColor];
        leftHalfLabel.textColor = [UIColor darkGrayColor];
        leftHalfLabel.text = @"http://itunes.apple.com/app/id";
        [self addSubview:leftHalfLabel];
        CGSize size = [leftHalfLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:25]];
        NSLog(@"%@",NSStringFromCGSize(size));
        
        self.idField = [[[UITextField alloc] initWithFrame:CGRectMake(leftHalfLabel.frame.origin.x+leftHalfLabel.frame.size.width, 0, 130, 90)] autorelease];
        self.idField.delegate = self;
        self.idField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.idField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.idField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.idField.returnKeyType = UIReturnKeyDone;
        self.idField.keyboardType = UIKeyboardTypeNumberPad;
        self.idField.font = [UIFont boldSystemFontOfSize:25];
        self.idField.textColor = [UIColor blackColor];
        self.idField.text = @"";
        self.idField.borderStyle = UITextBorderStyleNone;
        [self addSubview:self.idField];
        
        UIImage *scretchImg = [[UIImage imageNamed:@"scretchCircle"] resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
        grayRectImg = [[UIImageView alloc] initWithImage:scretchImg];
        grayRectImg.frame = CGRectMake(_idField.frame.origin.x, _idField.frame.origin.y+20, _idField.frame.size.width, _idField.frame.size.height-40);
        [self addSubview:grayRectImg];
        [grayRectImg release];
        
        rightHalfLabel = [[UILabel alloc] initWithFrame:CGRectMake(grayRectImg.frame.origin.x+grayRectImg.frame.size.width, 0, 80, 90)];
        rightHalfLabel.font = [UIFont boldSystemFontOfSize:25];
        rightHalfLabel.backgroundColor = [UIColor clearColor];
        rightHalfLabel.textColor = [UIColor darkGrayColor];
        rightHalfLabel.text = @"?mt=8";
        [self addSubview:rightHalfLabel];
        [rightHalfLabel release];
    }
    return self;
}

- (void) dismissKeyboard {
    if ([_idField isFirstResponder]) {
        [_idField resignFirstResponder];
    }
    
}


#pragma mark -
#pragma mark uitextfielddelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_idField resignFirstResponder];
    return YES;
    
}



@end
