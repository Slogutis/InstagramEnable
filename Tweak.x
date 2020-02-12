#import <UIKit.h>
#import <substrate.h>
#import <Foundation/Foundation.h>
#import <FBSharedFramework.h>
#import <Instagram.h>

/* Enable Music */


%hook IGMusicStickerQE
+(bool)musicAREffectsEnabledPeekWithUserSession:(id)arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig;
    }
    }
    %end
    
+(bool)musicStickerPreCaptureEnabled:(id):arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
+(bool)musicStickerPostCaptureEnabled(id)arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
+(bool)musicStickerEnabled:(id)arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
    
+(bool)musicAREffectsEnabledExposeWithUserSession:(id)arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
+(bool)audioIndicatorEnabled:(id)arg1 {
  arg1 = nil
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
+(bool)musicLyricsStickerPostCaptureEnabled:(id)arg1 {
  arg1 = nil;
  %orig(arg1);
  }else{
    return %orig
    }
    }
    %end
    
    
/* Enable Dark Mode */


%hook IGDefaultFeedTheme
-(bool)useDarkBackgroundLoadingStyle {
  return TRUE;
  }
  %end
  
%hook IGSimpleWebViewController
-(bool)enableSupportDarkMode {
  return TRUE;
  }
  %end
  
-(void)setEnableSupportDarkMode:(bool)arg1 {
  arg1 = TRUE;
  %orig(arg1);
  }else{
    }
    }
    %end
  
%hook IGDarkFeedTheme
-(bool)useDarkBackgroundLoadingStyle {
  return TRUE;
  }
  %end
  
-(bool)supportCTAHighlight {
  return TRUE;
  }
  %end
  
%hook IGLeftAlignedFullWidthCTAButton
-(void)setIsShownInDarkTheme:(bool)arg1 {
  arg1 = TRUE;
  %orig(arg1);
  }else{
    }
    }
    %end
    
    
    /* alert */
    
    
%hook AppDelegate 
-(void)applicationDidBecomeActive:(id)arg1 {
  %orig
  [[ UIAlertView alloc] intiwithtitle:@"Instagram" message:@"Successfully Installes!" delgate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
  
  %end
  
  


/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/
