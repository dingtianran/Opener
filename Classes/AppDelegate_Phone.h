


@class MainViewControllerPhone;
@class InfoView;
@interface AppDelegate_Phone : NSObject <UIApplicationDelegate>
{
	UIWindow *_window;
    MainViewControllerPhone *_mainController;
    UIImageView *_blackMask;
    InfoView *_infoView;
}

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) MainViewControllerPhone *mainController;

-(void)showInfoView;
-(void)hideInfoView;

@end

