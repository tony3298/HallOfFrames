//
//  ViewController.m
//  HallOfFrames
//
//  Created by Tony Dakhoul on 5/20/15.
//  Copyright (c) 2015 Tony Dakhoul. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"
#import "PictureCollectionViewCell.h"
#import "CustomView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CustomViewDelegate>

@property NSMutableArray *pictures;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSIndexPath *indexPath;

@property CustomView *customizationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.customizationView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];

    self.customizationView.delegate = self;


    Picture *pic1 = [[Picture alloc] initWithImage:[UIImage imageNamed:@"pic1"] andFrameColor:[UIColor grayColor]];

    Picture *pic2 = [[Picture alloc] initWithImage:[UIImage imageNamed:@"pic2"] andFrameColor:[UIColor grayColor]];

    Picture *pic3 = [[Picture alloc] initWithImage:[UIImage imageNamed:@"pic3"] andFrameColor:[UIColor grayColor]];

    self.pictures = [NSMutableArray arrayWithObjects:pic1, pic2, pic3, nil];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.pictures.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];

    Picture *picture = self.pictures[indexPath.row];

    cell.imageView.image = picture.image;
    cell.backgroundColor = picture.frameColor;

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    self.indexPath = indexPath;

    self.customizationView.frame = self.view.frame;
    self.customizationView.center = self.view.center;


    self.customizationView.frame = CGRectMake(0, self.customizationView.frame.size.height, self.customizationView.frame.size.width, self.customizationView.frame.size.height);


    [self.view addSubview:self.customizationView];

    [UIView animateWithDuration:0.5
                     animations:^{
                             self.customizationView.center = self.view.center;
                     }];

    self.customizationView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];

}

-(void)customView:(id)view didTapButton:(UIButton *)button {

    NSLog(@"button tapped");

    Picture *picture;
    picture = self.pictures[self.indexPath.row];

    if ([button.currentTitle isEqualToString:@"Red Frame"]) {

        picture.frameColor = [UIColor redColor];
        [self.collectionView reloadData];

        [UIView animateWithDuration:0.5 animations: ^{
        self.customizationView.frame = CGRectMake(0, self.customizationView.frame.size.height, self.customizationView.frame.size.width, self.customizationView.frame.size.height);
        } completion:^(BOOL finished) {

            [self.customizationView removeFromSuperview];
        }];

    } else if ([button.currentTitle isEqualToString:@"Green Frame"]) {

        picture.frameColor = [UIColor greenColor];
        [self.collectionView reloadData];

        [UIView animateWithDuration:0.5 animations: ^{
            self.customizationView.frame = CGRectMake(0, self.customizationView.frame.size.height, self.customizationView.frame.size.width, self.customizationView.frame.size.height);
        }completion:^(BOOL finished) {

            [self.customizationView removeFromSuperview];
        }];

    } else {

        picture.frameColor = [UIColor blueColor];
        [self.collectionView reloadData];

        [UIView animateWithDuration:0.5 animations: ^{
            self.customizationView.frame = CGRectMake(0, self.customizationView.frame.size.height, self.customizationView.frame.size.width, self.customizationView.frame.size.height);
        }completion:^(BOOL finished) {

            [self.customizationView removeFromSuperview];
        }];
    }
}

-(void)customView:(id)view onSliderDragged:(UISlider *)slider {

    NSLog(@"dragging");

    PictureCollectionViewCell *cell;

    if (slider.tag == 0) {

        cell = (PictureCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:self.indexPath];

        cell.backgroundColor = [UIColor colorWithRed:self.customizationView.redSlider.value/255 green:self.customizationView.greenSlider.value/255 blue:self.customizationView.blueSlider.value/255 alpha:1.0];

    } else if (slider.tag == 1) {

        cell = (PictureCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:self.indexPath];

        cell.backgroundColor = [UIColor colorWithRed:self.customizationView.redSlider.value/255 green:self.customizationView.greenSlider.value/255 blue:self.customizationView.blueSlider.value/255 alpha:1.0];


    } else {

        cell = (PictureCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:self.indexPath];

        cell.backgroundColor = [UIColor colorWithRed:self.customizationView.redSlider.value/255 green:self.customizationView.greenSlider.value/255 blue:self.customizationView.blueSlider.value/255 alpha:1.0];


    }

    
}

//-(void)showAnimation {
//
//    [self.view addSubview:geopointView]
//    geopointView.frame = // somewhere offscreen, in the direction you want it to appear from
//    [UIView animateWithDuration:10.0
//                     animations:^{
//                         geopointView.frame = // its final location
//                     }];
//}

@end
