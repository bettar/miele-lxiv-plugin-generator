//___FILEHEADER___

#import "___PACKAGENAMEASIDENTIFIER___.h"

// Don't modify this line
#define PLUGIN_ID "___UUID___"

@implementation ___PACKAGENAMEASIDENTIFIER___

- (void) initPlugin
{
}

- (long) filterImage:(NSString*) menuName
{
	ViewerController *new2DViewer;
	
	// In this plugin, we will simply duplicate the current 2D window!
	
	new2DViewer = [self duplicateCurrent2DViewerWindow];
	
	if (new2DViewer)
        return EXIT_SUCCESS;
    
    return EXIT_FAILURE;
}

@end
