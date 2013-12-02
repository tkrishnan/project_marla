//
//  ppatToDoItem.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ppatToDoItem : NSManagedObject
    @property (nonatomic, retain)NSString *itemName;
    @property (nonatomic)NSMutableArray *stepsList;
    @property (nonatomic, retain)NSSet *stepSet;
    @property (nonatomic)BOOL completed;
    @property (readonly) NSDate *creationDate;
- (NSMutableArray *)refreshStepsList;
@end
