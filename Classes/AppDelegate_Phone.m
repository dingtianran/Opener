#import "AppDelegate_Phone.h"
#import "MainViewControllerPhone.h"
#import "InfoView.h"


@implementation AppDelegate_Phone

@synthesize window = _window;
@synthesize mainController = _mainController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease]; 	
	self.window.backgroundColor = [UIColor blackColor];
    self.mainController = [[[MainViewControllerPhone alloc] init] autorelease];
    self.window.rootViewController = self.mainController;
	[self.window makeKeyAndVisible];
	
	return YES;
}

-(void)showInfoView {
    if (_infoView == nil) {
        _blackMask = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info-mask"]] autorelease];
        _blackMask.frame = self.window.bounds;
        _blackMask.alpha = 0.0;
        [self.window addSubview:_blackMask];
        
        _infoView = [[[InfoView alloc] initForPhone] autorelease];
        _infoView.transform = CGAffineTransformMakeRotation(-M_PI/6);
        _infoView.center = CGPointMake(160, 760);
        [self.window addSubview:_infoView];
    }

    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         _blackMask.alpha = 1.0;
                         _infoView.transform = CGAffineTransformMakeRotation(0);
                         _infoView.center = CGPointMake(160, 230);
                     }
                     completion:nil];
    
}

-(void)hideInfoView {
    if (_infoView!=nil) {

        [UIView animateWithDuration:0.5f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             _blackMask.alpha = 0.0;
                             _infoView.transform = CGAffineTransformMakeRotation(-M_PI/6);
                             _infoView.center = CGPointMake(160, 760);
                         }
                         completion:^(BOOL finished) {
                             [_infoView removeFromSuperview];
                             _infoView = nil;
                             [_blackMask removeFromSuperview];
                             _blackMask = nil;
                         }];
    }
    
}

-(void)dealloc 
{
    [_mainController release];
	[_window release];
	[super dealloc];
}


@end
