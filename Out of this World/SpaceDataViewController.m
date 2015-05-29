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
    
    cell.textLabel.text = @"Data"; //................................................................... hard coded label for the cell
    
    return cell; //..................................................................................... return the cell
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
