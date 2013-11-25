//
//  ppatToDoItem.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ppatToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
