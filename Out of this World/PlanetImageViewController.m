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
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    
    // contentsize of the scroll view is the same size as the frame of the image view
    self.scrollView.contentSize = self.imageView.frame.size;
    
    // put imageview on top of scroll view
    [self.scrollView addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
