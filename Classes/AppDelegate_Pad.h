


@class MainViewControllerPad;
@class InfoView;
@class BgTileView;
@interface AppDelegate_Pad : NSObject <UIApplicationDelegate> 
{
    MainViewControllerPad *_mainController;
	UIWindow *_window;
    UIImageView *_blackMask;
    InfoView *_infoView;
    BgTileView *_bgView;
}

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) MainViewControllerPad *mainController;


@end

