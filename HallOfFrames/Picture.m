//
//  Picture.m
//  HallOfFrames
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "Picture.h"

@implementation Picture

-(instancetype)initWithImage:(UIImage *)image andFrameColor:(UIColor *)color {

    self = [super init];

    if (self) {

        self.image = image;
        self.frameColor = color;
    }

    return self;
}

@end
