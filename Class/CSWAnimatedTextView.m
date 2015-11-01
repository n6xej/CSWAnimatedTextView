//
//  CSWAnimatedTextView.m
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/29/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//

/*
 You can set the following User Defined Runtime Attributes 
 in Interface Builder to override the default values
 
 duration : CGFloat
 fontSize : CGFloat
 reverse : BOOL
 colorOuter : UIColor
 colorInner : UIColor
 startPoint = CGPoint
 endPoint  = CGPoint
 fontName : NSString
 titleString : NSString
*/

#import "CSWAnimatedTextView.h"

@implementation CSWAnimatedTextObject

- (id)init
{
	if (self = [super init])
	{
		_duration = 5.0;
		_fontSize = 44.0;
		_reverse = NO;
		_colorOuter = [UIColor orangeColor];
		_colorInner = [UIColor yellowColor];
		_startPoint = CGPointMake(0.0, 0.5);
		_endPoint  = CGPointMake(1.0, 0.5);
		_fontName = @"HelveticaNeue-Bold";
		_titleString = @"Animated Text";
	}
	return self;
}

@end


@interface CSWAnimatedTextView ()

@property (nonatomic, strong, readwrite) CSWAnimatedTextObject *animatedTextObject;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UIFont *font;

@end

@implementation CSWAnimatedTextView

-(id)initWithCoder:(NSCoder *)aDecoder {
	if(self = [super initWithCoder:aDecoder])
	{
		_animatedTextObject = [[CSWAnimatedTextObject alloc] init];

		_gradientLayer = [[CAGradientLayer alloc] init];
		_gradientLayer.startPoint = _startPoint;
		_gradientLayer.endPoint = _endPoint;
		_gradientLayer.locations = @[@0.25, @0.5,@0.75];
		
		[self.layer addSublayer:_gradientLayer];
		
		[self initDefaults];
	}
	
	return self;
}

// defaults are needed because the variables have not been
// initialized with the Key Value Coding values from IB
- (void)initDefaults {
	_fontName = _animatedTextObject.fontName;
	_fontSize = _animatedTextObject.fontSize;
	
	_colorOuter = _animatedTextObject.colorOuter;
	self.colorInner = _animatedTextObject.colorInner;
	self.startPoint = _animatedTextObject.startPoint;
	self.endPoint = _animatedTextObject.endPoint;
	self.duration = _animatedTextObject.duration;
	self.reverse = _animatedTextObject.reverse;
	
	self.font = [UIFont fontWithName:_animatedTextObject.fontName size:_animatedTextObject.fontSize];
	self.titleString = _animatedTextObject.titleString;
}

- (void)setAnimatedTextObject:(CSWAnimatedTextObject *)animatedTextObject {
	_animatedTextObject = animatedTextObject;
	
	// set font value directly so don't invoke the rest of setter method
	_fontName = animatedTextObject.fontName;
	_fontSize = animatedTextObject.fontSize;
	_font = [UIFont fontWithName:_fontName size:_fontSize];
	
	_colorOuter = animatedTextObject.colorOuter;
	self.colorInner = animatedTextObject.colorInner;
	self.startPoint = animatedTextObject.startPoint;
	self.endPoint = animatedTextObject.endPoint;
	self.duration = animatedTextObject.duration;
	
	self.reverse = animatedTextObject.reverse;
	self.titleString = animatedTextObject.titleString;
}

- (void)layoutSubviews {
	_gradientLayer.frame = CGRectMake(
									  -self.bounds.size.width,
									  self.bounds.origin.y,
									  3 * self.bounds.size.width,
									  self.bounds.size.height);
}

- (void)didMoveToWindow {
	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
	
	animation.fromValue = @[@0.0, @0.0, @0.30];
	animation.toValue = @[@0.70, @1.0, @1.0];
	animation.duration = _duration;
	animation.removedOnCompletion = NO;
	animation.repeatCount = INFINITY;
	animation.autoreverses = _reverse;

	[_gradientLayer addAnimation:animation forKey:nil];
}


- (void)updateTextMask {
	
	NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
	
	paragraphStyle.alignment = NSTextAlignmentCenter;
	
	NSDictionary *attributes = @{ NSFontAttributeName: _font,
								  NSParagraphStyleAttributeName: paragraphStyle,
								  NSForegroundColorAttributeName: [UIColor whiteColor]};
	
	[self setNeedsDisplay];
	
	UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
	
	UIGraphicsGetCurrentContext();
	
	[_titleString drawInRect:self.bounds withAttributes:attributes];
	
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	CALayer *maskLayer = [[CALayer alloc] init];
	maskLayer.backgroundColor = [UIColor clearColor].CGColor;
	maskLayer.frame = CGRectOffset(self.bounds, self.bounds.size.width, 0);
	maskLayer.contents = (__bridge id _Nullable)(image.CGImage);
	
	_gradientLayer.mask = maskLayer;
}

- (void)setFontName:(NSString *)fontName {
	_fontName = fontName;
	_font = [UIFont fontWithName:_fontName size:_fontSize];
	
	[self updateTextMask];
}

- (void)setFontSize:(CGFloat)fontSize {
	
	_fontSize = fontSize;
	_animatedTextObject.fontSize = _fontSize;
	
	_font = [UIFont fontWithName:_fontName size:_fontSize];
	
	[self updateTextMask];
}

- (void)setFont:(UIFont *)font {
	
	_font = font;
	
	[self updateTextMask];
}

- (void)setReverse:(BOOL)reverse {
	_reverse = reverse;
	
	_animatedTextObject.reverse = _reverse;
	
	[self didMoveToWindow];
}

- (void)setTitleString:(NSString *)titleString {
	
	_titleString = titleString;
	_animatedTextObject.titleString = titleString;
	
	[self updateTextMask];
}

- (void)setColorOuter:(UIColor *)color {
	
	_colorOuter = color;
	_animatedTextObject.colorOuter = _colorOuter;
	
	if (_colorInner) {
		_gradientLayer.colors = [NSArray arrayWithObjects:(id) _colorOuter.CGColor, (id) _colorInner.CGColor, (id) _colorOuter.CGColor, nil];
	}
}

- (void)setColorInner:(UIColor *)color {
	
	_colorInner = color;
	_animatedTextObject.colorInner = _colorInner;
	
	if (_colorOuter) {
		_gradientLayer.colors = [NSArray arrayWithObjects:(id) _colorOuter.CGColor, (id) _colorInner.CGColor, (id) _colorOuter.CGColor, nil];
	}
}

- (void)setDuration:(CGFloat)duration {
	
	_duration = duration;
	_animatedTextObject.duration = duration;
	
	[self didMoveToWindow];
}



- (void)setStartPoint:(CGPoint)startPoint {
	if ( (startPoint.x >= 0 && startPoint.x <= 1) && (startPoint.y >= 0 && startPoint.y <= 1)) {
		_startPoint = startPoint;
		_animatedTextObject.startPoint = _startPoint;
		
		_gradientLayer.startPoint = _startPoint;
	}
}

- (void)setEndPoint:(CGPoint)endPoint {
	
	if ( (endPoint.x >= 0 && endPoint.x <= 1) && (endPoint.y >= 0 && endPoint.y <= 1)) {
		_endPoint = endPoint;
		_animatedTextObject.endPoint = _endPoint;
		
		_gradientLayer.endPoint = _endPoint;
	}
}

@end
