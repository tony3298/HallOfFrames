//
//  CustomView.m
//  HallOfFrames
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(IBAction)onButtonTapped:(UIButton *)sender {

    NSLog(@"Tap tap");

    [self.delegate customView:self didTapButton:sender];
}

- (IBAction)onSlider:(UISlider *)sender {

    [self.delegate customView:self onSliderDragged:sender];
}


@end
