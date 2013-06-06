//
//  UIView+Additions.m
//  PassPartout
//
//  Created by Federico Rampazzo on 6/6/13.
//  Copyright (c) 2013 Federico Rampazzo. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (UIImage *)captureView
{
	CGRect screenRect = self.bounds;

	UIGraphicsBeginImageContext(self.bounds.size);
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	[[UIColor clearColor] set];
	CGContextFillRect(ctx, screenRect);
	
    [self.layer renderInContext:ctx];

	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	        
	return newImage;
}

@end
