//
//  MainViewControllerPhone.h
//  Opener
//
//  Created by tianran DING on 12-1-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BgTileView;
@interface MainViewControllerPhone : UIViewController <UITextFieldDelegate> {
    
    BgTileView *_bgView;
    UILabel *leftHalfLabel;
    UITextField *_idField;
    UIImageView *grayRectImg;
    UILabel *rightHalfLabel;
    
}

@end
