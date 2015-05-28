//
//  Space Object.h
//  Out of this World
//
//  Created by OSX on 5/28/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> //.............. needed for UIImage

@interface Space_Object : NSObject

@property (nonatomic) float gravitionalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *interestingFact;

@property (strong, nonatomic) UIImage *spaceImage;

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image; //....... default constructor takes in a dictionary and an image

@end
