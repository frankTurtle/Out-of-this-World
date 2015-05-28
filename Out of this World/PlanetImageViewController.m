//
//  PlanetImageViewController.m
//  Out of this World
//
//  Created by OSX on 5/28/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import "PlanetImageViewController.h"

@interface PlanetImageViewController ()

@end

@implementation PlanetImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // sets tthe image based on our property spaceObject which is passed in from the sender object
    self.imageView = [[UIImageView alloc] initWithImage: self.spaceObject.spaceImage];
    
    // contentsize of the scroll view is the same size as the frame of the image view
    self.scrollView.contentSize = self.imageView.frame.size;
    
    // put imageview on top of scroll view
    [self.scrollView addSubview:self.imageView];
    
    // setup the view controller as the scroll views delegate
    self.scrollView.delegate = self;
    
    // zooming wont work unless we make sure the max / min zoom scales are not the same thing
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// DELEGATE method we're implementing for the scrollView
// asking us which view should we zoom in on?
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
