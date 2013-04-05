var NappAppearance = require('dk.napp.appearance');
Ti.API.info("module is => " + NappAppearance);

//////////////////////////////////////////////////////////////
// 		Napp Appearance - Use the power of iOS Appearance
//
// Set global styling once, and all windows will use these below styles by default.
// This is iOS only - and you need minimum iOS5
// Everything is optinal. You do not have to set them all, just what you need.
//
//////////////////////////////////////////////////////////////

NappAppearance.setGlobalStyling({
	navBarTitle:{
		color:"#bababa",
		shadowColor: "#fff",
		shadowOffset: {
			x:0,
			y:-1
		},
		font:{
			fontSize:17,
			fontFamily:"Noteworthy-Bold" //look at http://iosfonts.com/
		}
	},
	barButton:{
		color:"#bbb",
		shadowColor: "#ffffff",
		shadowOffset: {
			x:0,
			y:1
		},
		font:{
			fontSize:12,
			fontFamily:"Noteworthy-Bold" 
		},
		selected: {
			//button is pressed
			color:"#333",
			shadowColor: "#999",
			shadowOffset: {x:0,y:1},
			font:{
				fontSize:12,
				fontFamily:"Noteworthy-Bold" 
			}
		},
		
		backgroundImage:"/images/btn.png",
		backgroundSelectedImage:"/images/btn.png",
		backgroundDisabledImage:"/images/btn.png",
		tintColor:"#cacaca",
		titlePositionOffset:{x:0, y:2}
	},
	doneButton:{
		backgroundImage:"/images/btn-done.png",
		backgroundSelectedImage:"/images/btn-done.png",
		backgroundDisabledImage:"/images/btn-done.png",

		// Needs Proper Implementation in DkNaapAppearanceModule.m
		//titlePositionOffset:{x:0, y:0}
	},
	backButton:{
		backgroundImage:"/images/backbtn.png",
		backgroundSelectedImage:"/images/backbtn.png",
		backgroundDisabledImage:"/images/backbtn.png",
		titlePositionOffset:{x:0, y:2}
	},
	navBar:{
		//shadowImage:"/images/navBarShadow.png",
		backgroundImage:"/images/navBar.png",
		tintColor: "#FF0000"
	},
	slider:{
		leftTrackImage:"/images/slider_min.png",
		rightTrackImage:"/images/slider_max.png",
		thumbImage:"/images/slider_thumb.png"
	},
	progressBar:{
		//use either colors or images
		progressTintColor:"#CD1625",
		trackTintColor:"#ececec",
		//progressImage:"/images/image.png",
		//trackImage:"/images/image.png"
		
	},
	pageControl:{
		currentPageIndicatorTintColor:"#CD1625",
		pageIndicatorTintColor:"#ececec"
	},
	switchBar:{
		onTintColor:"#CD1625",
		tintColor:"#ececec",
		thumbTintColor:"#aaaaaa",
		onImage:"/images/switch_on.png",
		offImage:"/images/switch_off.png"
	},
	tabBar:{
		backgroundImage:"/images/tabBar.png",
		backgroundSelectedImage:"/images/tab_select_indicator.png"
	},
	toolbar:{
		tintColor:"#CD1625",
		//backgroundImage:"/images/toolbar.png",
	},
	searchBar:{
		
		//search bar
		backgroundImage:"/images/navBar.png",
		
		//search field
		//searchFieldBackgroundImage:"/images/image.png",
		//searchFieldHighlightedBackgroundImage:"/images/image.png",
		
		//cancel button
		cancelTitlePositionOffset:{x:0, y:3},
		
		//normal
		cancelTitle:"hit it",
		cancelButton: {
			color:"#333",
			shadowColor: "#fff",
			shadowOffset: {x:0,y:-1},
			font:{
				fontSize:14,
				fontFamily:"Noteworthy-Light", 
				fontWeight:"bold"
			}
		},
		
		//disabled
		cancelTitleDisabled: "disabled",
		cancelButtonDisabled: {
			color:"red"
			//add a few or many properties.. 
		},
		
		//selected
		cancelTitleSelected: "Hitted",
		cancelButtonSelected: {
			color:"blue",
			shadowColor: "#999",
			shadowOffset: {x:0,y:1},
			font:{
				fontSize:12,
				fontFamily:"Noteworthy-Bold" 
			}
		}
		
		//scopebar - works with extended SearchBar 
		/*scopeBarBackgroundImage:"/images/image.png",
		scopeBarButtonBackgroundImageUnselected:"/images/image.png",
		scopeBarButtonBackgroundImageSelected:"/images/image.png",
		scopeBarDividerImageUnselectedUnselected:"/images/image.png",
		scopeBarDividerImageSelectedUnselected:"/images/image.png",
		scopeBarDividerImageUnselectedSelected:"/images/image.png",
		color:"#cacaca",
		shadowColor: "#fff",
		font:{
			fontSize:12,
			fontFamily:"Noteworthy-Light", 
			fontWeight:"bold"
		},
		shadowOffset: {
			x:0,
			y:-1
		}*/
	},
	activityIndicator:{
		color:"#CD1625"
	},
	segmentedControl:{
		//use either tintColor or images
		//tintColor:"#CD1625",
		backgroundImageUnselected:"/images/segcontrol_uns.png",
		backgroundImageSelected:"/images/segcontrol_sel.png",
		
		dividerImageUnselectedUnselected:"/images/segcontrol_uns-uns.png",
		dividerImageSelectedUnselected:"/images/segcontrol_sel-uns.png",
		dividerImageUnselectedSelected:"/images/segcontrol_uns-sel.png",
		color:"#CD1625",
		shadowColor: "#666",
		font:{
			fontSize:14,
			fontFamily:"Noteworthy-Bold" //look at http://iosfonts.com/
		},
		shadowOffset: {
			x:0,
			y:1
		}
	},
	tableView:{
		sectionIndexColor:"#333",
		sectionIndexTrackingBackgroundColor:"#ddd",
		HeaderFooterTintColor:"#333"
	},
	popOver:{
		backgroundImage:"/image/popover_navbar.png",
		backgroundImageLandscape:"/image/popover_navbar_landscape.png"
	}
});


///////////////////////////////
// regular app coding - 
///////////////////////////////

var window = Ti.UI.createWindow({
	barColor:"#ddd",
	backgroundColor : 'white',
	title : "Napp Appearance"
});
var rightButton = Ti.UI.createButton({ 
	title:"Open"
});
rightButton.addEventListener("click", function(e){
	var win = Ti.UI.createWindow({
		title:"pushed window",
		backgroundColor:"#fff"
	});

	var doneButton = Ti.UI.createButton({
		title: "Done",
		style: Ti.UI.iPhone.SystemButtonStyle.DONE
	});

	win.setRightNavButton(doneButton);
	navGroup.open(win);
});
window.setRightNavButton(rightButton);

var navGroup = Ti.UI.iPhone.createNavigationGroup({window : window});
var main = Ti.UI.createWindow();
main.add(navGroup);


var scrollView = Ti.UI.createScrollView({
	layout:"vertical",
    left:0,
    right:0,
    top:0,
    contentHeight:'auto',
    contentWidth:"100%",
    showVerticalScrollIndicator: true,
    showHorizontalScrollIndicator: false
});


var searchBar = Ti.UI.createSearchBar({
	top:25,
	hintText:"search...",
	showCancel:true
});
searchBar.addEventListener("cancel", function(){
	searchBar.blur();
});
searchBar.addEventListener("return", function(){
	searchBar.blur();
});
scrollView.add(searchBar);

var slider = Ti.UI.createSlider({
    top: 15,
    min: 0,
    max: 100,
    width: 300,
    value: 50
});
scrollView.add(slider);


var pb = Ti.UI.createProgressBar({
    top: 15,
    width:300,
    height:Ti.UI.SIZE,
    min:0,
    max:10,
    value:3
});
scrollView.add(pb);
pb.show();

var basicSwitch = Ti.UI.createSwitch({
	top: 15,
	value:true
});
scrollView.add(basicSwitch);

var activityIndicator = Ti.UI.createActivityIndicator({
	top:15,
	style:Ti.UI.iPhone.ActivityIndicatorStyle.BIG,
	height:Ti.UI.SIZE,
	width:Ti.UI.SIZE
});
activityIndicator.show();
scrollView.add(activityIndicator);

var bb2 = Titanium.UI.iOS.createTabbedBar({
    labels:['One', 'Two', 'Three'],
    index:2,
    top:15,
    style:Titanium.UI.iPhone.SystemButtonStyle.BAR,
    height:35,
    width:280
});
scrollView.add(bb2);


window.add(scrollView);

main.open();
