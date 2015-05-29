//
//  SpaceDataViewController.h
//  Out of this World
//
//  Created by OSX on 5/29/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Space Object.h"

@interface SpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView; //.... new tableView
@property (strong, nonatomic) Space_Object *spaceObject; //.......... new spaceObject

@end
