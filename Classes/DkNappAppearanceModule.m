/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "DkNappAppearanceModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation DkNappAppearanceModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ace06789-ffad-4f30-80fc-9e5cc8835ffe";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"dk.napp.appearance";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(NSMutableDictionary *)parseParams:(NSDictionary *)dict
{
    NSMutableDictionary *output = [NSMutableDictionary dictionary];
    
    if ([dict objectForKey:@"color"] != nil) {
        [output setObject:[[TiUtils colorValue:@"color" properties:dict] _color] forKey:UITextAttributeTextColor];
    }
    
    if ([dict objectForKey:@"shadowColor"] != nil) {
        [output setObject:[[TiUtils colorValue:@"shadowColor" properties:dict] _color] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([dict objectForKey:@"shadowOffset"] != nil) {
        CGPoint p = [TiUtils pointValue:@"shadowOffset" properties:dict];
        CGSize size = {p.x,p.y};
        [output setObject:[NSValue valueWithCGSize:size] forKey:UITextAttributeTextShadowOffset];
    }
    
    if ([dict objectForKey:@"font"] != nil) {
        NSDictionary * fontValue = [dict objectForKey:@"font"];
        UIFont *font =  [[TiUtils fontValue:fontValue] font];
        [output setObject:font forKey:UITextAttributeFont];
    }
    return output;
}

//http://stackoverflow.com/questions/9424112/what-properties-can-i-set-via-an-uiappearance-proxy
-(void)setGlobalStyling:(id)args
{
    ENSURE_UI_THREAD(setGlobalStyling,args);
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    if(args != nil){

        NSDictionary *navBar = [args objectForKey:@"navBar"];
        NSDictionary *navBarTitle = [args objectForKey:@"navBarTitle"];
        NSDictionary *barButton = [args objectForKey:@"barButton"];
        NSDictionary *doneButton = [args objectForKey:@"doneButton"];
        NSDictionary *backButton = [args objectForKey:@"backButton"];
        NSDictionary *tabBar = [args objectForKey:@"tabBar"];
        NSDictionary *slider = [args objectForKey:@"slider"];
        NSDictionary *progressBar = [args objectForKey:@"progressBar"];
        NSDictionary *pageControl = [args objectForKey:@"pageControl"];
        NSDictionary *switchDict = [args objectForKey:@"switchBar"];
        NSDictionary *toolbar = [args objectForKey:@"toolbar"];
        NSDictionary *searchBar = [args objectForKey:@"searchBar"];
        NSDictionary *activityIndicator = [args objectForKey:@"activityIndicator"];
        NSDictionary *segmentedControl = [args objectForKey:@"segmentedControl"];
        
        NSDictionary *tableView = [args objectForKey:@"tableView"];
        NSDictionary *popOver = [args objectForKey:@"popOver"];
        
        //nav bar Title text for UINavigationBar
        if(navBarTitle != nil){
            NSMutableDictionary *attributes = [self parseParams:navBarTitle];
            if([[attributes allKeys] count] > 0){
                [[UINavigationBar appearance] setTitleTextAttributes:attributes];
            }
            [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:[TiUtils floatValue:@"verticalPositionOffset" properties:navBarTitle] forBarMetrics:UIBarMetricsDefault];

        }
        
        if(navBar != nil){
            [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:[TiUtils stringValue:@"shadowImage" properties:navBar]]];
            UIImage *navbuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:navBar]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UINavigationBar appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:navBar] _color]];
            
            // Set the background image for *all* UINavigationBars
            [[UINavigationBar appearance] setBackgroundImage:navbuttonimg forBarMetrics:UIBarMetricsDefault];
            [[UINavigationBar appearance] setBackgroundImage:navbuttonimg forBarMetrics:UIBarMetricsLandscapePhone];
        }
        
        if(backButton !=nil){
            UIImage *backbuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:backButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbuttonimg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbuttonimg forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
            
            //selected
            UIImage *backgroundSelectedimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:backButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
            
            //disabled
            UIImage *backgroundDisabledimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundDisabledImage" properties:backButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsLandscapePhone];
            
            if ([backButton objectForKey:@"titlePositionOffset"] != nil) {
                CGPoint p = [TiUtils pointValue:@"titlePositionOffset" properties:backButton];
                [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
            }
        }
        
        if(barButton != nil){
            NSMutableDictionary *barAttributes = [self parseParams:barButton];
            if([[barAttributes allKeys] count] > 0){
                [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateNormal];
            }
            if ([barButton objectForKey:@"selected"] != nil) {
                barAttributes = [self parseParams:[barButton objectForKey:@"selected"]];
                if([[barAttributes allKeys] count] > 0){
                    [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateHighlighted];
                }
            }
            if ([barButton objectForKey:@"disabled"] != nil) {
                barAttributes = [self parseParams:[barButton objectForKey:@"disabled"]];
                if([[barAttributes allKeys] count] > 0){
                    [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateDisabled];
                }
            }
            [[UIBarButtonItem appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:barButton] _color]];
            
            if ([barButton objectForKey:@"titlePositionOffset"] != nil) {
                CGPoint p = [TiUtils pointValue:@"titlePositionOffset" properties:barButton];
                [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
            }
            
            //normal
            UIImage *backgroundimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:barButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundimg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundimg forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
            
            //selected
            UIImage *backgroundSelectedimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:barButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
            
            //disabled
            UIImage *backgroundDisabledimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundDisabledImage" properties:barButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsLandscapePhone];
            
        }

        if(doneButton !=nil){
            UIImage *donebuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:doneButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:donebuttonimg forState:UIControlStateNormal style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:donebuttonimg forState:UIControlStateNormal style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];
            
            //selected
            UIImage *doneselectedimage = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:doneButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:doneselectedimage forState:UIControlStateHighlighted style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:doneselectedimage forState:UIControlStateHighlighted style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];
            
            //disabled
            UIImage *donedisabledimage = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundDisabledImage" properties:doneButton]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
            [[UIBarButtonItem appearance] setBackgroundImage:donedisabledimage forState:UIControlStateDisabled style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:donedisabledimage forState:UIControlStateDisabled style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];

            //Needs proper implementation
            /*if ([doneButton objectForKey:@"titlePositionOffset"] != nil) {
                CGPoint donep = [TiUtils pointValue:@"titlePositionOffset" properties:doneButton];
                [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(donep.x,donep.y) style:UIBarButtonItemStyleDone forBarMetrics:UIBarMetricsDefault];
            }*/
        }

        if(tabBar != nil){
            // Customizing the tab bar
            UIImage *tabBackground = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:tabBar]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            [[UITabBar appearance] setBackgroundImage:tabBackground];
            [[UITabBar appearance] setSelectionIndicatorImage: [UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:tabBar]]];
        } 
        
        if(slider != nil){
            // Customizing the UISlider
            UIImage *leftTrackImage = [[UIImage imageNamed:[TiUtils stringValue:@"leftTrackImage" properties:slider]]
                                 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
            UIImage *rightTrackImage = [[UIImage imageNamed:[TiUtils stringValue:@"rightTrackImage" properties:slider]]
                                 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
            UIImage *thumbImage = [UIImage imageNamed:[TiUtils stringValue:@"thumbImage" properties:slider]];
            
            [[UISlider appearance] setMaximumTrackImage:rightTrackImage forState:UIControlStateNormal];
            [[UISlider appearance] setMinimumTrackImage:leftTrackImage forState:UIControlStateNormal];
            [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateNormal];
            [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateHighlighted];
        }
        
        if(progressBar != nil){
            // Customize the progress view
            [[UIProgressView appearance] setProgressTintColor:[[TiUtils colorValue:@"progressTintColor" properties:progressBar] _color]];
            [[UIProgressView appearance] setTrackTintColor:[[TiUtils colorValue:@"trackTintColor" properties:progressBar] _color]];
            
            [[UIProgressView appearance] setProgressImage:[[UIImage imageNamed:[TiUtils stringValue:@"progressImage" properties:progressBar]]
                                                           resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)]];
            [[UIProgressView appearance] setTrackImage:[[UIImage imageNamed:[TiUtils stringValue:@"trackImage" properties:progressBar]]
                                                           resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)]];
        }
        
        if(pageControl != nil){
            // Customize the page control
            [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[[TiUtils colorValue:@"currentPageIndicatorTintColor" properties:pageControl] _color]];
            [[UIPageControl appearance] setPageIndicatorTintColor:[[TiUtils colorValue:@"pageIndicatorTintColor" properties:pageControl] _color]];
        }
        
        if(switchDict !=nil){
            // Customizing the switch control
            [[UISwitch appearance] setOnTintColor:[[TiUtils colorValue:@"onTintColor" properties:switchDict] _color]];
            [[UISwitch appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:switchDict] _color]];
            [[UISwitch appearance] setThumbTintColor:[[TiUtils colorValue:@"thumbTintColor" properties:switchDict] _color]];
            
            // Customizing the switch text
            [[UISwitch appearance] setOnImage:[UIImage imageNamed:[TiUtils stringValue:@"onImage" properties:switchDict]]];
            [[UISwitch appearance] setOffImage:[UIImage imageNamed:[TiUtils stringValue:@"offImage" properties:switchDict]]];
        }
        
        if(toolbar !=nil){
            //toolbar
            [[UIToolbar appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:toolbar] _color]];
            [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:toolbar]]
                                    forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        }
        
        
        if(searchBar !=nil){
            
            [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"searchFieldBackgroundImage" properties:searchBar]] forState:UIControlStateNormal];
            
            [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"searchFieldHighlightedBackgroundImage" properties:searchBar]] forState:UIControlStateHighlighted];
            
            [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:searchBar]]];
            
            //cancel button
            if ([searchBar objectForKey:@"cancelButton"] != nil) {
                NSMutableDictionary *barAttributes = [self parseParams:[searchBar objectForKey:@"cancelButton"]];
                if([[barAttributes allKeys] count] > 0){
                    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateNormal];
                }
            }
            if ([searchBar objectForKey:@"cancelButtonSelected"] != nil) {
                NSMutableDictionary *barAttributes = [self parseParams:[searchBar objectForKey:@"cancelButtonSelected"]];
                if([[barAttributes allKeys] count] > 0){
                    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateHighlighted];
                }
            }
            if ([searchBar objectForKey:@"cancelButtonDisabled"] != nil) {
                NSMutableDictionary *barAttributes = [self parseParams:[searchBar objectForKey:@"cancelButtonDisabled"]];
                if([[barAttributes allKeys] count] > 0){
                    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateDisabled];
                }
            }
            
            //titles
            [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitle" properties:searchBar] forState:UIControlStateNormal];
            [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitleDisabled" properties:searchBar] forState:UIControlStateDisabled];
            [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitleSelected" properties:searchBar] forState:UIControlStateHighlighted];
            
            if ([searchBar objectForKey:@"cancelTitlePositionOffset"] != nil) {
                CGPoint p = [TiUtils pointValue:@"cancelTitlePositionOffset" properties:searchBar];
                [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
            }
            
            
            //scopebar
            [[UISearchBar appearance] setScopeBarBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarBackgroundImage" properties:searchBar]]];
            [[UISearchBar appearance] setScopeBarButtonBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarButtonBackgroundImageUnselected" properties:searchBar]] forState:UIControlStateNormal];
            [[UISearchBar appearance] setScopeBarButtonBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarButtonBackgroundImageSelected" properties:searchBar]] forState:UIControlStateSelected];
            
            [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageUnselectedUnselected" properties:searchBar]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
            [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageSelectedUnselected" properties:searchBar]] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal];
            [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageUnselectedSelected" properties:searchBar]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected];
            
            
            NSMutableDictionary *scopeBarAttributes = [self parseParams:searchBar];
            if([[scopeBarAttributes allKeys] count] > 0){
                [[UISearchBar appearance] setScopeBarButtonTitleTextAttributes:scopeBarAttributes forState:UIControlStateNormal];
            }
            
        }
        
        if(activityIndicator != nil){
            [[UIActivityIndicatorView appearance] setColor:[[TiUtils colorValue:@"color" properties:activityIndicator] _color]];
        }
        
        if(segmentedControl != nil){
            [[UISegmentedControl appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:segmentedControl] _color]];
            
            NSMutableDictionary *segmentedAttributes = [self parseParams:segmentedControl];
            if([[segmentedAttributes allKeys] count] > 0){
                [[UISegmentedControl appearance] setTitleTextAttributes:segmentedAttributes forState:UIControlStateNormal];
            }
            
            [[UISegmentedControl appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageUnselected" properties:segmentedControl]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UISegmentedControl appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageSelected" properties:segmentedControl]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            
            [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageUnselectedUnselected" properties:segmentedControl]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageSelectedUnselected" properties:segmentedControl]] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageUnselectedSelected" properties:segmentedControl]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        }
        
        if(tableView != nil){
            if([TiUtils isIOS6OrGreater]){
                //tableview
                [[UITableView appearance] setSectionIndexColor:[[TiUtils colorValue:@"sectionIndexColor" properties:tableView] _color]];
                [[UITableView appearance] setSectionIndexTrackingBackgroundColor:[[TiUtils colorValue:@"sectionIndexTrackingBackgroundColor" properties:tableView] _color]];
                
                //header & footer view
                [[UITableViewHeaderFooterView appearance] setTintColor:[[TiUtils colorValue:@"HeaderFooterTintColor" properties:tableView] _color]];
            }
        }
        
        if(popOver != nil){
            if([TiUtils isIPad]){
                [[UINavigationBar appearanceWhenContainedIn:[UIPopoverController class], nil] setBackgroundImage:[[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:popOver]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forBarMetrics:UIBarMetricsDefault];
                [[UINavigationBar appearanceWhenContainedIn:[UIPopoverController class], nil] setBackgroundImage:[[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageLandscape" properties:popOver]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forBarMetrics:UIBarMetricsLandscapePhone];
            }
        }
    }
}


@end
