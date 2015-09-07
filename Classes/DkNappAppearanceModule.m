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


#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

-(void)notifyOfStyleChange:(NSString*)componentName
{

	if([self _hasListeners:@"styleChange"]) {
		NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
							   componentName,@"componentName",
							   nil
							   ];
        
		[self fireEvent:@"styleChange" withObject:event];
	}
}


#pragma Public APIs
-(NSMutableDictionary *)parseParams:(NSDictionary *)dict
{
    NSMutableDictionary *output = [NSMutableDictionary dictionary];
    
    if([dict objectForKey:@"color"] != nil) {
        [output setObject:[[TiUtils colorValue:@"color" properties:dict] _color] forKey:UITextAttributeTextColor];
    }
    
    if([dict objectForKey:@"shadowColor"] != nil) {
        [output setObject:[[TiUtils colorValue:@"shadowColor" properties:dict] _color]
                   forKey:UITextAttributeTextShadowColor];
    }
    
    if([dict objectForKey:@"shadowOffset"] != nil) {
        CGPoint p = [TiUtils pointValue:@"shadowOffset" properties:dict];
        CGSize size = {p.x,p.y};
        [output setObject:[NSValue valueWithCGSize:size] forKey:UITextAttributeTextShadowOffset];
    }
    
    if([dict objectForKey:@"font"] != nil) {
        NSDictionary * fontValue = [dict objectForKey:@"font"];
        UIFont *font =  [[TiUtils fontValue:fontValue] font];
        [output setObject:font forKey:UITextAttributeFont];
    }
    return output;
}

-(void)setNavbar:(id)args
{
    ENSURE_DICT(args);
    
    if([args objectForKey:@"shadowImage"] != nil) {
        [[UINavigationBar appearance] setShadowImage:
         [UIImage imageNamed:[TiUtils stringValue:@"shadowImage" properties:args]]];
    }
    
    if([args objectForKey:@"backgroundImage"] != nil) {
        UIImage *navbuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        // Set the background image for *all* UINavigationBars
        [[UINavigationBar appearance] setBackgroundImage:navbuttonimg forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setBackgroundImage:navbuttonimg forBarMetrics:UIBarMetricsLandscapePhone];
    }

    if([args objectForKey:@"tintColor"] != nil) {
        [[UINavigationBar appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
    }
    
    [self notifyOfStyleChange:@"navbar"];
    
}

-(void)setNavbarTitle:(id)args
{
    ENSURE_DICT(args);
    
    NSMutableDictionary *attributes = [self parseParams:args];
    if([[attributes allKeys] count] > 0){
        [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    }
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:
     [TiUtils floatValue:@"verticalPositionOffset"properties:args] forBarMetrics:UIBarMetricsDefault];
    [self notifyOfStyleChange:@"navbarTitle"];
}

-(void)setDoneButton:(id)args
{
    ENSURE_DICT(args);
    
    if([args objectForKey:@"backgroundImage"] != nil) {
        UIImage *donebuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:donebuttonimg forState:UIControlStateNormal style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:donebuttonimg forState:UIControlStateNormal style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];
    }
    
    //selected
    if([args objectForKey:@"backgroundSelectedImage"] != nil) {
        UIImage *doneselectedimage = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:doneselectedimage forState:UIControlStateHighlighted style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:doneselectedimage forState:UIControlStateHighlighted style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];
    }
    
    //disabled
    if([args objectForKey:@"backgroundDisabledImage"] != nil) {
        UIImage *donedisabledimage = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundDisabledImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:donedisabledimage forState:UIControlStateDisabled style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:donedisabledimage forState:UIControlStateDisabled style:UIBarButtonItemStyleDone barMetrics:UIBarMetricsLandscapePhone];
    }
    //Needs proper implementation
    /*if ([doneButton objectForKey:@"titlePositionOffset"] != nil) {
     CGPoint donep = [TiUtils pointValue:@"titlePositionOffset" properties:doneButton];
     [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(donep.x,donep.y) style:UIBarButtonItemStyleDone forBarMetrics:UIBarMetricsDefault];
     }*/
    
    [self notifyOfStyleChange:@"doneButton"];
}
-(void)setBackButton:(id)args
{
    
    ENSURE_DICT(args);
    
    if([args objectForKey:@"tintColor"] != nil) {
        [UIImageView appearanceWhenContainedIn:[UINavigationBar class], nil].tintColor =
            [[TiUtils colorValue:@"tintColor" properties:args] _color];
    }
    
    if([args objectForKey:@"backgroundImage"] != nil) {
         UIImage *backbuttonimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
         [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbuttonimg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
         [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbuttonimg forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    }
    
    //selected
    if([args objectForKey:@"backgroundSelectedImage"] != nil) {
        UIImage *backgroundSelectedimg =
        [[UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
    
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
    }
    
    //disabled
    if([args objectForKey:@"backgroundDisabledImage"] != nil) {
        UIImage *backgroundDisabledimg =
        [[UIImage imageNamed:[TiUtils stringValue:@"backgroundDisabledImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsLandscapePhone];
    }
    
    if([args objectForKey:@"titlePositionOffset"] != nil) {
        CGPoint p = [TiUtils pointValue:@"titlePositionOffset" properties:args];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
    }
        
    [self notifyOfStyleChange:@"backButton"];
}

-(void)setButtonBar:(id)args
{
    
    ENSURE_DICT(args);
    
    NSMutableDictionary *barAttributes = [self parseParams:args];
    if([[barAttributes allKeys] count] > 0){
        [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"selected"] != nil) {
        barAttributes = [self parseParams:[args objectForKey:@"selected"]];
        if([[barAttributes allKeys] count] > 0){
            [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateHighlighted];
        }
    }
    
    if([args objectForKey:@"disabled"] != nil) {
        barAttributes = [self parseParams:[args objectForKey:@"disabled"]];
        if([[barAttributes allKeys] count] > 0){
            [[UIBarButtonItem appearance] setTitleTextAttributes:barAttributes forState:UIControlStateDisabled];
        }
    }
    
    if([args objectForKey:@"tintColor"] != nil) {
        [[UIBarButtonItem appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"titlePositionOffset"] != nil) {
        CGPoint p = [TiUtils pointValue:@"titlePositionOffset" properties:args];
        [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
    }
    
    //normal
    if([args objectForKey:@"backgroundImage"] != nil) {
        UIImage *backgroundimg = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundimg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundimg forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    }
    
    //selected
    if([args objectForKey:@"backgroundSelectedImage"] != nil) {
        UIImage *backgroundSelectedimg = [[UIImage imageNamed:
                                       [TiUtils stringValue:@"backgroundSelectedImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundSelectedimg forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
    }
    //disabled
    if([args objectForKey:@"backgroundDisabledImage"] != nil) {
        UIImage *backgroundDisabledimg = [[UIImage imageNamed:
                                       [TiUtils stringValue:@"backgroundDisabledImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundDisabledimg forState:UIControlStateDisabled barMetrics:UIBarMetricsLandscapePhone];
    }
    
    [self notifyOfStyleChange:@"buttonBar"];
}

-(void) setTabBar:(id)args
{
    
    ENSURE_DICT(args);
    
    if([args objectForKey:@"backgroundImage"] != nil) {
    // Customizing the tab bar
        UIImage *tabBackground = [[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [[UITabBar appearance] setBackgroundImage:tabBackground];
    }
    
    if([args objectForKey:@"backgroundSelectedImage"] != nil) {
        [[UITabBar appearance] setSelectionIndicatorImage: [UIImage imageNamed:[TiUtils stringValue:@"backgroundSelectedImage" properties:args]]];
    }
    
    // Customizing the tab bar item
    NSMutableDictionary *normalAttributes = [self parseParams:args];
    if([[normalAttributes allKeys] count] > 0){
        [[UITabBarItem appearance] setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    }
    
    NSMutableDictionary *selectedAttributes = [self parseParams:[args objectForKey:@"selected"]];
    if([[selectedAttributes allKeys] count] > 0){
        [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    }
    
    [self notifyOfStyleChange:@"tabBar"];
}

-(void) setSlider:(id)args
{
    
    ENSURE_DICT(args);
    if([args objectForKey:@"leftTrackImage"] != nil) {
        // Customizing the UISlider
        UIImage *leftTrackImage = [[UIImage imageNamed:[TiUtils stringValue:@"leftTrackImage" properties:args]]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [[UISlider appearance] setMinimumTrackImage:leftTrackImage forState:UIControlStateNormal];
    }
    if([args objectForKey:@"rightTrackImage"] != nil) {
        UIImage *rightTrackImage = [[UIImage imageNamed:[TiUtils stringValue:@"rightTrackImage" properties:args]]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [[UISlider appearance] setMaximumTrackImage:rightTrackImage forState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"thumbImage"] != nil) {
        UIImage *thumbImage = [UIImage imageNamed:[TiUtils stringValue:@"thumbImage" properties:args]];
        [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateNormal];
        [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateHighlighted];
    }
    
    [self notifyOfStyleChange:@"slider"];
}

-(void) setProgressBar:(id)args
{
    
    ENSURE_DICT(args);
    if([args objectForKey:@"progressTintColor"] != nil) {
        // Customize the progress view
        [[UIProgressView appearance] setProgressTintColor:
         [[TiUtils colorValue:@"progressTintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"trackTintColor"] != nil) {
        [[UIProgressView appearance] setTrackTintColor:[[TiUtils colorValue:@"trackTintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"progressImage"] != nil) {
        [[UIProgressView appearance] setProgressImage:[[UIImage imageNamed:[TiUtils stringValue:@"progressImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)]];
    }
    
    if([args objectForKey:@"trackImage"] != nil) {
        [[UIProgressView appearance] setTrackImage:[[UIImage imageNamed:[TiUtils stringValue:@"trackImage" properties:args]]
                                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)]];
    
    }
    [self notifyOfStyleChange:@"progressBar"];
}

-(void) setPageControl:(id)args
{
   ENSURE_DICT(args);
    
    if([args objectForKey:@"currentPageIndicatorTintColor"] != nil) {
        // Customize the page control
        [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[[TiUtils colorValue:@"currentPageIndicatorTintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"pageIndicatorTintColor"] != nil) {
        [[UIPageControl appearance] setPageIndicatorTintColor:[[TiUtils colorValue:@"pageIndicatorTintColor" properties:args] _color]];
    }
}

-(void) setSwitchBar:(id)args
{
    ENSURE_DICT(args);
    if([args objectForKey:@"onTintColor"] != nil) {
        // Customizing the switch control
        [[UISwitch appearance] setOnTintColor:[[TiUtils colorValue:@"onTintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"tintColor"] != nil) {
        [[UISwitch appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"thumbTintColor"] != nil) {
        [[UISwitch appearance] setThumbTintColor:[[TiUtils colorValue:@"thumbTintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"onImage"] != nil) {
        // Customizing the switch text
        [[UISwitch appearance] setOnImage:[UIImage imageNamed:[TiUtils stringValue:@"onImage" properties:args]]];
    }
    
    if([args objectForKey:@"offImage"] != nil) {
        [[UISwitch appearance] setOffImage:[UIImage imageNamed:[TiUtils stringValue:@"offImage" properties:args]]];
    }
    
    [self notifyOfStyleChange:@"switchBar"];
}

-(void) setToolBar:(id)args
{
    ENSURE_DICT(args);

    if([args objectForKey:@"tintColor"] != nil) {
        //toolbar
        [[UIToolbar appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
    }
    
    if([args objectForKey:@"backgroundImage"] != nil) {
        [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]]forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    }
    
    [self notifyOfStyleChange:@"toolBar"];
}

-(void) setPopOver:(id)args
{
    ENSURE_DICT(args);
    
    if([TiUtils isIPad]){
        
        if([args objectForKey:@"tintColor"] != nil) {
            [[UIBarButtonItem appearanceWhenContainedIn:[UIPopoverController class], nil] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
        }
        
        if([args objectForKey:@"backgroundImage"] != nil) {
            [[UINavigationBar appearanceWhenContainedIn:[UIPopoverController class], nil] setBackgroundImage:[[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forBarMetrics:UIBarMetricsDefault];
        }

        if([args objectForKey:@"backgroundImageLandscape"] != nil) {
            [[UINavigationBar appearanceWhenContainedIn:[UIPopoverController class], nil] setBackgroundImage:[[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageLandscape" properties:args]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forBarMetrics:UIBarMetricsLandscapePhone];
        }
        
        [self notifyOfStyleChange:@"popOver"];
    }
    
}

-(void) setTableView:(id)args
{
    ENSURE_DICT(args);
    if([TiUtils isIOS6OrGreater]){
        if([args objectForKey:@"sectionIndexColor"] != nil) {
            //tableview
            [[UITableView appearance] setSectionIndexColor:
             [[TiUtils colorValue:@"sectionIndexColor" properties:args] _color]];
        }
        
        if([args objectForKey:@"sectionIndexBackgroundColor"] != nil) {
            [[UITableView appearance] setSectionIndexBackgroundColor:[[TiUtils colorValue:@"sectionIndexBackgroundColor" properties:args] _color]];
        }
        
        if([args objectForKey:@"sectionIndexTrackingBackgroundColor"] != nil) {
            [[UITableView appearance] setSectionIndexTrackingBackgroundColor:[[TiUtils colorValue:@"sectionIndexTrackingBackgroundColor" properties:args] _color]];
        }
        
        if([args objectForKey:@"HeaderFooterTintColor"] != nil) {
            //header & footer view
            [[UITableViewHeaderFooterView appearance] setTintColor:[[TiUtils colorValue:@"HeaderFooterTintColor" properties:args] _color]];
        }
            
        [self notifyOfStyleChange:@"tableView"];
    }
}

-(void) setSearchBar:(id)args
{
    ENSURE_DICT(args);
    
    [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"searchFieldBackgroundImage" properties:args]] forState:UIControlStateNormal];
    
    [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"searchFieldHighlightedBackgroundImage" properties:args]] forState:UIControlStateHighlighted];
    
    [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImage" properties:args]]];
    
    //cancel button
    if([args objectForKey:@"cancelButton"] != nil) {
        NSMutableDictionary *barAttributes = [self parseParams:[args objectForKey:@"cancelButton"]];
        if([[barAttributes allKeys] count] > 0){
            [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateNormal];
        }
    }
    
    if([args objectForKey:@"cancelButtonSelected"] != nil) {
        NSMutableDictionary *barAttributes = [self parseParams:[args objectForKey:@"cancelButtonSelected"]];
        if([[barAttributes allKeys] count] > 0){
            [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateHighlighted];
        }
    }
    if([args objectForKey:@"cancelButtonDisabled"] != nil) {
        NSMutableDictionary *barAttributes = [self parseParams:[args objectForKey:@"cancelButtonDisabled"]];
        if([[barAttributes allKeys] count] > 0){
            [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:barAttributes forState:UIControlStateDisabled];
        }
    }
    
    if([args objectForKey:@"cancelTitle"] != nil) {
        //titles
        [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitle" properties:args] forState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"cancelTitleDisabled"] != nil) {
        [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitleDisabled" properties:args] forState:UIControlStateDisabled];
    }
    
    if([args objectForKey:@"cancelTitleSelected"] != nil) {
        [[UIButton appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:[TiUtils stringValue:@"cancelTitleSelected" properties:args] forState:UIControlStateHighlighted];
    }
    
    if ([args objectForKey:@"cancelTitlePositionOffset"] != nil) {
        CGPoint p = [TiUtils pointValue:@"cancelTitlePositionOffset" properties:args];
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitlePositionAdjustment:UIOffsetMake(p.x,p.y) forBarMetrics:UIBarMetricsDefault];
    }
    
    if([args objectForKey:@"scopeBarBackgroundImage"] != nil) {
        //scopebar
        [[UISearchBar appearance] setScopeBarBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarBackgroundImage" properties:args]]];
    }
    
    if([args objectForKey:@"scopeBarButtonBackgroundImageUnselected"] != nil) {
        [[UISearchBar appearance] setScopeBarButtonBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarButtonBackgroundImageUnselected" properties:args]] forState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"scopeBarButtonBackgroundImageSelected"] != nil) {
        [[UISearchBar appearance] setScopeBarButtonBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarButtonBackgroundImageSelected" properties:args]] forState:UIControlStateSelected];
    }
    
    if([args objectForKey:@"scopeBarDividerImageUnselectedUnselected"] != nil) {
        [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageUnselectedUnselected" properties:args]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"scopeBarDividerImageSelectedUnselected"] != nil) {
        [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageSelectedUnselected" properties:args]] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"scopeBarDividerImageUnselectedSelected"] != nil) {
        [[UISearchBar appearance] setScopeBarButtonDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"scopeBarDividerImageUnselectedSelected" properties:args]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected];
    }
    
    NSMutableDictionary *scopeBarAttributes = [self parseParams:args];
    if([[scopeBarAttributes allKeys] count] > 0){
        [[UISearchBar appearance] setScopeBarButtonTitleTextAttributes:scopeBarAttributes forState:UIControlStateNormal];
    }
    
    [self notifyOfStyleChange:@"searchBar"];
}

-(void)setActivityIndicator:(id)args
{
    ENSURE_DICT(args);
    if([args objectForKey:@"color"] != nil) {
        [[UIActivityIndicatorView appearance] setColor:[[TiUtils colorValue:@"color" properties:args] _color]];
    }
    [self notifyOfStyleChange:@"activityIndicator"];
}

-(void)setSegmentedControl:(id)args
{
    ENSURE_DICT(args);

    if([args objectForKey:@"tintColor"] != nil) {
        [[UISegmentedControl appearance] setTintColor:[[TiUtils colorValue:@"tintColor" properties:args] _color]];
    }
    
    NSMutableDictionary *segmentedAttributes = [self parseParams:args];
    if([[segmentedAttributes allKeys] count] > 0){
        [[UISegmentedControl appearance] setTitleTextAttributes:segmentedAttributes forState:UIControlStateNormal];
    }
    
    if([args objectForKey:@"backgroundImageUnselected"] != nil) {
        [[UISegmentedControl appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageUnselected" properties:args]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if([args objectForKey:@"backgroundImageSelected"] != nil) {
        [[UISegmentedControl appearance] setBackgroundImage:[UIImage imageNamed:[TiUtils stringValue:@"backgroundImageSelected" properties:args]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    }
    
    if([args objectForKey:@"dividerImageUnselectedUnselected"] != nil) {
        [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageUnselectedUnselected" properties:args]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if([args objectForKey:@"dividerImageSelectedUnselected"] != nil) {
        [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageSelectedUnselected" properties:args]] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if([args objectForKey:@"dividerImageUnselectedSelected"] != nil) {
        [[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:[TiUtils stringValue:@"dividerImageUnselectedSelected" properties:args]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    }
    
    [self notifyOfStyleChange:@"segmentControl"];
}

//http://stackoverflow.com/questions/9424112/what-properties-can-i-set-via-an-uiappearance-proxy
-(void)setGlobalStyling:(id)args
{
    ENSURE_UI_THREAD(setGlobalStyling,args);
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    if(args == nil){
        return;
    }
        
    //nav bar Title text for UINavigationBar
    if([args objectForKey:@"navBarTitle"]){
        [self setNavbarTitle:[args objectForKey:@"navBarTitle"]];
    }
    
    if([args objectForKey:@"navBar"]){
        [self setNavbar:[args objectForKey:@"navBar"]];
    }
    
    if([args objectForKey:@"backButton"]){
        [self setBackButton:[args objectForKey:@"backButton"]];
    }
    
    if([args objectForKey:@"barButton"]){
        [self setButtonBar:[args objectForKey:@"barButton"]];
    }
    
    if([args objectForKey:@"doneButton"]){
        [self setDoneButton:[args objectForKey:@"doneButton"]];
    }
    
    if([args objectForKey:@"tabBar"]){
        [self setTabBar:[args objectForKey:@"tabBar"]];
    }
    
    if([args objectForKey:@"slider"]){
        [self setSlider:[args objectForKey:@"slider"]];
    }

    if([args objectForKey:@"progressBar"]){
        [self setProgressBar:[args objectForKey:@"progressBar"]];
    }
    
    if([args objectForKey:@"pageControl"]){
        [self setPageControl:[args objectForKey:@"pageControl"]];
    }

    if([args objectForKey:@"switchBar"]){
        [self setSwitchBar:[args objectForKey:@"switchBar"]];
    }
    
    if([args objectForKey:@"toolbar"]){
        [self setToolBar:[args objectForKey:@"toolbar"]];
    }

    if([args objectForKey:@"popOver"]){
        [self setPopOver:[args objectForKey:@"popOver"]];
    }

    if([args objectForKey:@"tableView"]){
        [self setTableView:[args objectForKey:@"tableView"]];
    }
    
    if([args objectForKey:@"searchBar"]){
        [self setSearchBar:[args objectForKey:@"searchBar"]];
    }
    
    if([args objectForKey:@"activityIndicator"]){
        [self setActivityIndicator:[args objectForKey:@"activityIndicator"]];
    }

    if([args objectForKey:@"segmentedControl"]){
        [self setSegmentedControl:[args objectForKey:@"segmentedControl"]];
    }

}


@end
