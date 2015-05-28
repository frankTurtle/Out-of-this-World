//
//  PlanetImageViewController.h
//  Out of this World
//
//  Created by OSX on 5/28/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanetImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView; //.... hook up scroll view to storyboard
@property (strong, nonatomic) UIImageView *imageView; //............... an imageView to drop ontop of the scroll view to display the planet

@end
