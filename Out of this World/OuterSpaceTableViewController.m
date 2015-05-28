//
//  OuterSpaceTableViewController.m
//  Out of this World
//
//  Created by OSX on 5/26/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import "OuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "Space Object.h"

@interface OuterSpaceTableViewController ()

@end

@implementation OuterSpaceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Uranus";

    self.planets = [[NSMutableArray alloc] init]; //......................................................................... initialize our planets array
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) //........................................... loop through each dictionary in our Astronomical data array
    {
        NSString *imageName = [NSString stringWithFormat: @"%@.jpg", planetData[PLANET_NAME] ]; //........................... create a string with the planet name from each dictionary object
        Space_Object *planet = [[Space_Object alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName] ]; //... create a new space object and use our default initializer
        [self.planets addObject: planet]; //................................................................................. populate our planets array with our new space object
    }
    
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
    
//    // Dictionary fun
//    NSMutableDictionary *myDict = [[NSMutableDictionary alloc] init];
//    NSString *firstColor = @"red";
//    [myDict setObject:firstColor forKey:@"firetruck color"];
//    [myDict setObject:@"blue" forKey:@"ocean color"];
//    [myDict setObject:@"yellow" forKey:@"star color"];
//    
//    NSLog(@"%@", myDict);
//    
//    NSString *blueString = [myDict objectForKey:@"ocean color"];
//    NSLog(@"%@", blueString);
    
//    NSNumber *myNumber = [NSNumber numberWithInt:5]; //.............. wraps a primitive in an object
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
//    
//    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
//    
//    if (indexPath.section == 0) {
//        cell.backgroundColor = [UIColor redColor];
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor blueColor];
//    }

    Space_Object *planet = [self.planets objectAtIndex:indexPath.row]; //...................................... creates a space object from our planets array
    cell.textLabel.text = planet.name; //...................................................................... upddates the cell text to the name of the planet
    cell.detailTextLabel.text = planet.nickName; //............................................................ gives the secondary text on the label
    cell.imageView.image = planet.spaceImage; //............................................................... gives the cell's image the image from our planet
    
    cell.backgroundColor = [UIColor clearColor]; //............................................................ sets the background color to clear in the cell
    cell.textLabel.textColor = [UIColor whiteColor]; //........................................................ sets the labels text color to white
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0]; //................................ changes the detail text color to a white with 1.0 alpha
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
