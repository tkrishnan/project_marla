//
//  ppatStep.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/30/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ppatStep : NSManagedObject
@property NSString *stepText;
@property NSNumber *stepNumber;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
@property NSString *taskName;
@end
