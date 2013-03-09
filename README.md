# Napp Appearance

## Description

The Napp Appearance Module extends the Appcelerator Titanium Mobile framework with a global styling functionality.
Napp Appearance use the power of iOS UIAppearance on Titanium UI components. This module is iOS only and iOS5+.

![NappAppearance](https://raw.github.com/viezel/NappAppearance/master/documentation/image.png)

The module is licensed under the MIT license.


## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module platform="iphone">dk.napp.appearance</module> 
    </modules>


## Reference

For more detailed code examples take a look into the example app

### setGlobalStyling
The module has only one method. Use this is the very beginning of your app to style UI component throughout the entire app.
All the below parameters are all `optional`. Just specify what you need. 

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
				fontFamily:"Noteworthy-Bold" //look at http://iosfonts.com/
			},
			tintColor:"#cacaca"
		},
		navBar:{
			backgroundImage:"/images/navBar.png",
			buttonBackgroundImage:"/images/btn.png"
		},
		backButton:{
			backgroundImage:"/images/backbtn.png"
		},
		slider:{
			leftTrackImage:"/images/slider_min.png",
			rightTrackImage:"/images/slider_max.png",
			thumbImage:"/images/slider_thumb.png"
		},
		progressBar:{
			progressTintColor:"#CD1625",
			trackTintColor:"#ececec"
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
			//searchFieldBackgroundImage:"/images/image.png",
			backgroundImage:"/images/navBar.png",
			cancelTitle:"hit it",
			cancelTitleColor:"#cacaca",
			cancelFont:{
				fontSize:12,
				fontFamily:"Noteworthy-Light", //look at http://iosfonts.com/
				fontWeight:"bold"
			},
			cancelShadowColor: "#fff",
			cancelShadowOffset: {
				x:0,
				y:-1
			}
		},
		activityIndicator:{
			color:"#CD1625"
		},
		segmentedControl:{
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
		}
	});


## Changelog
 

**v1.0**
Initial implementation. 


## Author

**Mads Møller**  
web: http://www.napp.dk  
email: mm@napp.dk  
twitter: @nappdev  


## License

    Copyright (c) 2010-2013 Napp ApS

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.