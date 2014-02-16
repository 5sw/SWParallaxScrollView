# SWParallaxScrollView

A UIScrollView subclass with multiple layers and a parallax effect.

[![Build Status](https://travis-ci.org/5sw/SWParallaxScrollView.png?branch=master)](https://travis-ci.org/5sw/SWParallaxScrollView)

## Install

To use just add SWParallaxScrollView.h and SWParallaxScrollView.mm to your project or install via [CocoaPods](http://cocoapods.org).

Add a pod entry to your Podfile:

	pod 'SWParallaxScrollView', '~> 0.1.1'
	
Install the pod(s) by running:

	pod install

##  Usage

Instantiate and configure _SWParallaxScrollView_ like a regular _UIScrollView_. When adding subviews they get added on layer 0 by
default and everything behaves like a regular scroll view. Subviews can also be added to a given layer:

	[parallaxScrollView addSubview: someView onLayer: layer]
	
If the layer is less than zero those subviews will scroll slower than the regular scroll view. And if the layer is greater than
0 the subviews will scroll faster.


## Demo

To run the demo open _ParallaxScrollView.xcodeproj_ and run.

The graphics in the demo app are taken from Wikipedia user OhSqueezy. ([Background](http://commons.wikimedia.org/wiki/File:Sky_back_layer.png), [Middle Layer](http://commons.wikimedia.org/wiki/File:Vegetation_%28middle_layer%29.png), [Foreground](http://commons.wikimedia.org/wiki/File:Ground_%28front_layer%29.png))