//
//  ppatToDoItem.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatToDoItem.h"

@implementation ppatToDoItem

@synthesize stepsList = _stepsList;
@dynamic completed;
@dynamic stepSet;
@dynamic creationDate;
@dynamic itemName;

//Singleton Model
// If no stepsList defined, load stepsSet, sort it,  and create Mutable Array out of it
- (NSMutableArray *)stepsList
{
    if (_stepsList != nil) {
        return _stepsList;
    }
    
    NSMutableArray *unsortedSteps = [NSMutableArray arrayWithArray:[self.stepSet allObjects]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"stepNumber" ascending:YES];
    
    NSArray *sorted = [unsortedSteps sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    _stepsList = [NSMutableArray arrayWithArray:sorted];
    return _stepsList;
    
}

-(NSMutableArray *)refreshStepsList
{
    NSMutableArray *unsortedSteps = [NSMutableArray arrayWithArray:[self.stepSet allObjects]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"stepNumber" ascending:YES];
    
    NSArray *sorted = [unsortedSteps sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    _stepsList = [NSMutableArray arrayWithArray:sorted];
    return _stepsList;
}


@end
