//
//  Picture.h
//  HallOfFrames
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Picture : NSObject

@property UIImage *image;
@property UIColor *frameColor;

-(instancetype)initWithImage:(UIImage *)image andFrameColor:(UIColor *)color;

@end
