//
//  SpaceDataViewController.m
//  Out of this World
//
//  Created by OSX on 5/29/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import "SpaceDataViewController.h"

@interface SpaceDataViewController ()

@end

@implementation SpaceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor]; //.......... sets the views background to black
    self.tableView.backgroundColor = [UIColor clearColor]; //..... sets the tableView's bg to clear
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell"; //................................................... create a cell identifier String
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                            forIndexPath:indexPath]; //................. creates a tableViewCell, checks the storyboard for a cell named DataCell ( set this in Storyboard )
    
    // populate each row with data from the spaceObject properties
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Nickname :";
            cell.detailTextLabel.text = self.spaceObject.nickName;
            break;
            
        case 1:
            cell.textLabel.text = @"Diameter (km) :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
            
        case 2:
            cell.textLabel.text = @"Gravitational Force";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.gravitionalForce];
            break;
            
        case 3:
            cell.textLabel.text = @"Length of Year in days:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.yearLength];
            break;
            
        case 4:
            cell.textLabel.text = @"Length of Day:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.dayLength];
            break;
            
        case 5:
            cell.textLabel.text = @"Temperature:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.temperature];
            break;
            
        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",self.spaceObject.numberOfMoons];
            break;
            
        case 7:
            cell.textLabel.text = @"Interesting Fact:";
            cell.detailTextLabel.text = self.spaceObject.interestingFact;
            break;
        
        default:
            break;
    }
    
    return cell; //..................................................................................... return the cell
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
