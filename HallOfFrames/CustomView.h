//
//  CustomView.h
//  HallOfFrames
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

-(void)customView:(id)view didTapButton:(UISlider *)button;

-(void)customView:(id)view onSliderDragged:(UISlider *)slider;


@end

@interface CustomView : UIView

@property (nonatomic, assign) id <CustomViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@end
