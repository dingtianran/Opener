#import "AppDelegate_Pad.h"
#import "MainViewControllerPad.h"
#import "InfoView.h"
#import "BgTileView.h"
#import "InfoView.h"

@implementation AppDelegate_Pad

@synthesize window = _window;
@synthesize mainController = _mainController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
	self.window.backgroundColor = [UIColor blackColor];
    
    _bgView = [[BgTileView alloc] initWithFrame:self.window.bounds];
    [self.window addSubview:_bgView];
    [_bgView release];
    
    self.mainController = [[[MainViewControllerPad alloc] init] autorelease];
    self.window.rootViewController = self.mainController;
	[self.window makeKeyAndVisible];
	
	return YES;
}




-(void)dealloc 
{
	[_window release];
	[super dealloc];
}


@end
