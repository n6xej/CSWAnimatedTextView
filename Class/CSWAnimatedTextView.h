//
//  CSWAnimatedTextView.h
//  CSWAnimatedTextView
//
//  Created by Christopher Worley on 10/29/15.
//  Copyright © 2015 Christopher Worley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSWAnimatedTextObject : NSObject

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *fontName;
@property (nonatomic, strong) UIColor *colorOuter;
@property (nonatomic, strong) UIColor *colorInner;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGFloat duration;
@property (nonatomic) CGFloat fontSize;
@property (nonatomic) BOOL reverse;

@end

@interface CSWAnimatedTextView : UIView

@property (nonatomic, strong, readonly) CSWAnimatedTextObject *animatedTextObject;

@property (nonatomic, strong) IBInspectable NSString *titleString;
@property (nonatomic, strong) IBInspectable NSString *fontName;
@property (nonatomic, strong) IBInspectable UIColor *colorOuter;
@property (nonatomic, strong) IBInspectable UIColor *colorInner;
@property (nonatomic) IBInspectable CGPoint startPoint;
@property (nonatomic) IBInspectable CGPoint endPoint;
@property (nonatomic) IBInspectable CGFloat duration;
@property (nonatomic) IBInspectable CGFloat fontSize;
@property (nonatomic) IBInspectable BOOL reverse;

- (void)setAnimatedTextObject:(CSWAnimatedTextObject *)animatedTextObject;

@end
