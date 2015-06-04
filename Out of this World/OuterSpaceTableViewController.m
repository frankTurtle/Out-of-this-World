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
#import "PlanetImageViewController.h"
#import "SpaceDataViewController.h"

@interface OuterSpaceTableViewController ()

@end

@implementation OuterSpaceTableViewController

#define ADDED_SPACE_OBJECTS_KEY @"Added Space Objects Array"

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

// Method to pass data between views!!!
// we look at the viewController we're passing into and its properties
// then we set that property to the one from our current view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // check to see if sender is UITableViewCell
    // if the sender object that triggers our segue is a UITableViewCell
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        // want to test the view controller we're going is the PlanetImageViewController class
        if ([segue.destinationViewController isKindOfClass:[PlanetImageViewController class]])
        {
            // alows us to access the view controller we're going to
            // also allows us to access the properties of the viewController we're going to
            PlanetImageViewController *nextViewController = segue.destinationViewController;
            
            // find which sender from the table view is the sender!
            // tableView property is automatically added because this is a tableViewController - grants us access
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            
            // determines which object from the planets we want
            Space_Object *selectedObject;
            
            // if its section 0 we need to user our planets array
            if (path.section == 0)
                selectedObject = self.planets[path.row];
            else if (path.section == 1) //............................ if its not section 0 its one of the added ones
                selectedObject = self.addedSpaceObjects[path.row];
            
            // sets the space object property from the TO viewController to the one from our list
            nextViewController.spaceObject = selectedObject;
        }
    }
    
    // CODE TO HANDLE THE INFORAMTION BUTTON PRESSED ON THE PLANET CELL
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[SpaceDataViewController class]])
        {
            SpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            Space_Object *selectedObject;
            
            if(path.section == 0)
                selectedObject = self.planets[path.row];
            else
                selectedObject = self.addedSpaceObjects[path.row];
            
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[AddSpaceObjectViewController class]])
    {
        AddSpaceObjectViewController *addSpceObjectVC = segue.destinationViewController;
        
        // sets the property we created in the spaceObjectViewController ( the delegate ) to this view
        // allows us to access it in that class
        addSpceObjectVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AddSpaceObjectViewControllerDelegate

-(void)didCancel
{
    NSLog(@"Did cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Method to handle when we want to add a new spaceObject to the list
-(void)addSpaceObject:(Space_Object *)spaceObject
{
    // if the array addedSpaceObjects does not exits create it
    if (!self.addedSpaceObjects)
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    
    // add the spaceObject that's passed in when the protocol is called
    [self.addedSpaceObjects addObject:spaceObject];
    
    //TODO: Save to NSUSerDefaults here
    // gives the standardUsersDefault array with they key ADDED_SPACE_OBJECTS_KEY
    // makes it mutable so that we can add / subtract as necessary
    NSMutableArray *spaceObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECTS_KEY] mutableCopy];
    
    // make sure spaceObjectsAsPropertyLists is a thing, if not it creates it
    if (!spaceObjectsAsPropertyLists)
        spaceObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    // add spaceObjects to array
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    
    // save to NSUserDefaults
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADDED_SPACE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"Space Object added");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // check to see if it should update with new data
    [self.tableView reloadData];
}

#pragma mark - Helper methods

// Method to create an dictionary out of the spaceObject
-(NSDictionary *)spaceObjectAsAPropertyList:(Space_Object *)spaceObject
{
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage); //.................... PNG representation of the image
    
    NSDictionary *dictionary = @{
                                     PLANET_NAME :              spaceObject.name,
                                     PLANET_GRAVITY :         @(spaceObject.gravitionalForce),
                                     PLANET_DIAMETER :        @(spaceObject.diameter),
                                     PLANET_YEAR_LENGTH :     @(spaceObject.yearLength),
                                     PLANET_DAY_LENGTH :      @(spaceObject.dayLength),
                                     PLANET_TEMPERATURE :     @(spaceObject.temperature),
                                     PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons),
                                     PLANET_NICKNAME :          spaceObject.nickName,
                                     PLANET_INTERESTING_FACT :  spaceObject.interestingFact,
                                     PLANET_IMAGE :             imageData
                                 };
    
    return dictionary;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if ([self.addedSpaceObjects count])
        return 2;
    else
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 1)
        return [self.addedSpaceObjects count];
    else
        return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 1)
    {
        Space_Object *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickName;
        cell.imageView.image = planet.spaceImage;
    }
    else
    {
        Space_Object *planet = [self.planets objectAtIndex:indexPath.row]; //...................................... creates a space object from our planets array
        cell.textLabel.text = planet.name; //...................................................................... upddates the cell text to the name of the planet
        cell.detailTextLabel.text = planet.nickName; //............................................................ gives the secondary text on the label
        cell.imageView.image = planet.spaceImage; //............................................................... gives the cell's image the image from our planet
    }
    
    cell.backgroundColor = [UIColor clearColor]; //............................................................ sets the background color to clear in the cell
    cell.textLabel.textColor = [UIColor whiteColor]; //........................................................ sets the labels text color to white
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0]; //................................ changes the detail text color to a white with 1.0 alpha
    
    
    return cell;
}

#pragma mark UITableView Delegate

// Method to manage the functionality for the accessory i button on each cell
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath]; //.............................. manually configure a segue to the spaceDataView
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
