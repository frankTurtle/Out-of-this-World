//
//  SpaceDataViewController.h
//  Out of this World
//
//  Created by OSX on 5/29/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView; //.... new tableView

@end
