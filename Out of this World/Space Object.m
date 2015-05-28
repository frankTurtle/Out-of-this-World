//
//  Space Object.m
//  Out of this World
//
//  Created by OSX on 5/28/15.
//  Copyright (c) 2015 LebonTech solutions. All rights reserved.
//

#import "Space Object.h"
#import "AstronomicalData.h"

@implementation Space_Object

// going to pass off the current init process to the one we've created
// return myself
-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

// Implementation of our own init method
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init]; //....................................... required for default initializer
    
    self.name = data[PLANET_NAME];
    self.gravitionalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickName = data[PLANET_NICKNAME];
    self.interestingFact = data[PLANET_INTERESTING_FACT];
    self.spaceImage = image;
    
    return self;
}

@end
