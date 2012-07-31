//
//  InfoView.h
//  Opener
//
//  Created by tianran DING on 12-1-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UIView {
    UIImageView *_tileBg;
    UIViewController *_hostController;
}

@property (nonatomic, assign) UIViewController *hostController;

- (id)initForPhone;
- (id)initForPad;

@end
