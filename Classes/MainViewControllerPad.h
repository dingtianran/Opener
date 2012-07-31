//
//  MainViewControllerPad.h
//  Opener
//
//  Created by tianran DING on 12-1-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BgTileView;
@class InfoView;
@class InputView;
@interface MainViewControllerPad : UIViewController  {
    
    UIButton *_openButton;
    InfoView *_infoView;
    InputView *_inputView;
    
    UIImageView *_blackMask;
    
    NSString *_appID;
    
}

@property (nonatomic, copy) NSString *appID;

- (void) infoCloseButtonPressed;

@end
