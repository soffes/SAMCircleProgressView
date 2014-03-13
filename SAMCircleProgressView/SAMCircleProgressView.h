//
//  SAMCircleProgressView.h
//  SAMCircleProgressView
//
//  Created by Sam Soffes on 4/22/10.
//  Copyright 2010-2014 Sam Soffes. All rights reserved.
//

/**
 Pie chart style progress pie chart similar to the one in Xcode 3's status bar.
 */
@interface SAMCircleProgressView : UIView

///---------------------------
///@name Managing the Progress
///---------------------------

/**
 The current progress shown by the receiver.
 
 The current progress is represented by a floating-point value between `0.0` and `1.0`, inclusive, where `1.0` indicates
 the completion of the task. Values less than `0.0` and greater than `1.0` are pinned to those limits.
 
 The default value is `0.0`.
 */
@property (nonatomic) CGFloat progress;

///-------------------------------------
/// @name Configuring the Pie Appearance
///-------------------------------------

/**
 The outer border width.
 
 The default is `2.0`.
 */
@property (nonatomic) CGFloat borderWidth;

/**
 The outer border color.
 
 @see defaultPrimaryColor
 */
@property (nonatomic) UIColor *borderColor;

/**
 The inner border width.

 The default is `2.0`.
 */
@property (nonatomic) CGFloat innerBorderWidth;

/**
 The inner border color.

 @see defaultPrimaryColor
 */
@property (nonatomic) UIColor *innerBorderColor;

/**
 The fill color.
 
 @see defaultPrimaryColor
 */
@property (nonatomic) UIColor *fillColor;

/**
 The background color.
 
 The default is white.
 */
@property (nonatomic) UIColor *fillBackgroundColor;


///---------------
/// @name Defaults
///---------------

/**
 The default value of `borderColor` and `fillColor`.
 */
+ (UIColor *)defaultPrimaryColor;

@end
