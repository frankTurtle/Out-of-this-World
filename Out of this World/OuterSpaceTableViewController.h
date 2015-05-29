//
//  OuterSpaceTableViewController.h
//  Out of this World
//
//  Created by OSX on 5/26/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddSpaceObjectViewController.h"

@interface OuterSpaceTableViewController : UITableViewController <AddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
