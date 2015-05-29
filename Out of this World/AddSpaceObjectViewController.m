//
//  AddSpaceObjectViewController.m
//  Out of this World
//
//  Created by OSX on 5/29/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import "AddSpaceObjectViewController.h"
#import "Space Object.h"

@interface AddSpaceObjectViewController ()

@end

@implementation AddSpaceObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
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

- (IBAction)addButtonPressed:(id)sender
{
    // create a new space object using the helper method
    Space_Object *newSpaceObject = [self returnNewSpaceObject];
    
    // pass it back
    [self.delegate addSpaceObject:newSpaceObject];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    // access the delegate property and call the didCancel method
    // the didCancel logic is defined in the tableViewController
    [self.delegate didCancel];
}

// Method that will return a newSpaceObject based on values the user types in textFields
- (Space_Object *)returnNewSpaceObject
{
    Space_Object *newSpaceObject = [[Space_Object alloc] init];
    
    newSpaceObject.name = self.nameTextField.text;
    newSpaceObject.nickName = self.nicknameTextField.text;
    newSpaceObject.diameter = [self.diametterTextField.text floatValue];
    newSpaceObject.temperature = [self.tempTextField.text floatValue];
    newSpaceObject.numberOfMoons = [self.noOfMoonsTextField.text intValue];
    newSpaceObject.interestingFact = self.interestingFactTextField.text;
    
    return newSpaceObject;
}

@end
