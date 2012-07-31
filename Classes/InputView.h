//
//  InputView.h
//  Opener
//
//  Created by tianran DING on 12-1-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputView : UIView <UITextFieldDelegate> {
    UILabel *leftHalfLabel;
    UITextField *_idField;
    UIImageView *grayRectImg;
    UILabel *rightHalfLabel;
    UIViewController *_hostController;
    
}

@property (nonatomic, assign) UITextField *idField;
@property (nonatomic, assign) UIViewController *hostController;

- (void) dismissKeyboard;

@end
