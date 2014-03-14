//
//  SAMCircleProgressView.m
//  SAMCircleProgressView
//
//  Created by Sam Soffes on 4/22/10.
//  Copyright 2010-2014 Sam Soffes. All rights reserved.
//

#import "SAMCircleProgressView.h"

@implementation SAMCircleProgressView

#pragma mark - Accessors

- (void)setProgress:(CGFloat)newProgress {
	_progress = fmaxf(0.0f, fminf(1.0f, newProgress));
	[self setNeedsDisplay];
}


- (void)setBorderWidth:(CGFloat)borderWidth {
	_borderWidth = borderWidth;
	[self setNeedsDisplay];
}


- (void)setBorderColor:(UIColor *)borderColor {
	_borderColor = borderColor;
	[self setNeedsDisplay];
}


- (void)setInnerBorderWidth:(CGFloat)innerBorderWidth {
	_innerBorderWidth = innerBorderWidth;
	[self setNeedsDisplay];
}


- (void)setInnerBorderColor:(UIColor *)innerBorderColor {
	_innerBorderColor = innerBorderColor;
	[self setNeedsDisplay];
}


- (void)setFillColor:(UIColor *)fillColor {
	_fillColor = fillColor;
	[self setNeedsDisplay];
}


- (void)setFillBackgroundColor:(UIColor *)fillBackgroundColor {
	_fillBackgroundColor = fillBackgroundColor;
	[self setNeedsDisplay];
}


#pragma mark - Class Methods

+ (UIColor *)defaultPrimaryColor {
	return [UIColor colorWithRed:0.612f green:0.710f blue:0.839f alpha:1.0f];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)aFrame {
    if ((self = [super initWithFrame:aFrame])) {
		[self initialize];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Background
	if (self.fillBackgroundColor) {
		[self.fillBackgroundColor set];
		CGContextFillEllipseInRect(context, rect);
	}

	// Math
	CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
	CGFloat radius = rect.size.width / 2.0f;
	CGFloat angle = (M_PI * 2.0f * self.progress) - M_PI_2;
	CGPoint points[3] = {
		CGPointMake(center.x, 0.0f),
		center,
		CGPointMake(center.x + radius * cosf(angle), center.y + radius * sinf(angle))
	};

	// Fill
	if (self.fillColor) {
		[self.fillColor set];
		if (_progress > 0.0f) {
			CGContextAddLines(context, points, 3);
			CGContextAddArc(context, center.x, center.y, radius, -M_PI_2, angle, false);
			CGContextDrawPath(context, kCGPathEOFill);
		}
	}

	// Inner Border
	if (self.progress < 0.99f && self.innerBorderColor && self.innerBorderWidth > 0.0f) {
		[self.innerBorderColor set];
		CGContextAddLines(context, points, sizeof(points) / sizeof(points[0]));
		CGContextDrawPath(context, kCGPathStroke);
	}

	// Outer Border
	if (self.borderColor && self.borderWidth > 0.0f) {
		[self.borderColor set];
		CGContextSetLineWidth(context, self.borderWidth);
		CGRect pieInnerRect = CGRectMake(self.borderWidth / 2.0f, self.borderWidth / 2.0f, rect.size.width - self.borderWidth, rect.size.height - self.borderWidth);
		CGContextStrokeEllipseInRect(context, pieInnerRect);
	}
}


#pragma mark - Private

- (void)initialize {
	self.backgroundColor = [UIColor clearColor];
	
	self.progress = 0.0f;
	self.borderWidth = 2.0f;
	self.borderColor = [[self class] defaultPrimaryColor];
	self.fillColor = self.borderColor;
	self.fillBackgroundColor = [UIColor whiteColor];
}

@end
