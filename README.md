# CSWAnimatedTextView

[![Version](https://img.shields.io/cocoapods/v/CSWAnimagedTextView.svg?style=flat)](http://cocoapods.org/pods/CSWAnimagedTextView)
[![License](https://img.shields.io/cocoapods/l/CSWAnimagedTextView.svg?style=flat)](http://cocoapods.org/pods/CSWAnimagedTextView)
[![Platform](https://img.shields.io/cocoapods/p/CSWAnimagedTextView.svg?style=flat)](http://cocoapods.org/pods/CSWAnimagedTextView)

A Text View that shows the texts as a color gradient that animates

<p align="center"><img src="https://raw.github.com/n6xej/CSWAnimatedTextView/master/ScreenShot/ScreenShot1.png"/></p>

## Installation

Install CSWAnimatedTextView by using [CocoaPods](http://cocoapods.org). Include the following in your Podfile:

```
pod 'CSWAnimatedTextView'
``` 

## How to get started

Add a UIView in Interface Builder and in the identity inspector set the View's Custom Class to CSWAnimatedTextView. There are nine Key Value Coding values defined as User Defined Runtime Attributes (UDRA). There are hard coded defaults if no UDRA is defined.

colorOuter  - The start and end colors of the gradient
colorInner  - The middle color of the gradient
duration    - Animation loop length
reverse     - Should animation reverse direction
fontSize    - Size of font in Text View
fontName    - Name of the font in Text View
startPoint  - Startpoint of the gradient
endPoint    - Endpoint of the gradient
titleString - Text of the Text View

 can be added to your controller's view using Interface Builder or programmatically with the following code:
identity inspector Custom Class

<p align="center"><img src="https://raw.github.com/n6xej/CSWAnimatedTextView/master/ScreenShot/ScreenShot2.png"/></p>
<p align="center"><img src="https://raw.github.com/n6xej/CSWAnimatedTextView/master/ScreenShot/ScreenShot3.png"/></p>

```
    
```

# Screenshot

### iPhone

![](/ScreenShot/ScreenShot1.png) 

# Example Project

[CSWAnimatedTextViewExample example](https://github.com/n6xej/CSWAnimatedTextViewExample)

# License

The MIT License (MIT)

Copyright (C) 2015 Christopher Worley
		
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE LICENSE

