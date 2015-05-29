//
//  AddSpaceObjectViewController.h
//  Out of this World
//
//  Created by OSX on 5/29/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddSpaceObjectViewControllerDelegate <NSObject>

// makes you have to use it!!! MMUUAHAHA
@required

// both methods will be implemented in the OuterSpaceTableViewController
-(void)addSpaceObject;
-(void)didCancel;

@end

@interface AddSpaceObjectViewController : UIViewController

// when we've access to the instance inside of the tableViewController we can set this delegate property to self
// all delegate properties are declared weak so we can deallocate objects when needed
// id is type unknown that conforms to the AddSpaceObjectViewControllerDelegate
@property (weak, nonatomic) id <AddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diametterTextField;
@property (strong, nonatomic) IBOutlet UITextField *tempTextField;
@property (strong, nonatomic) IBOutlet UITextField *noOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)addButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@end
