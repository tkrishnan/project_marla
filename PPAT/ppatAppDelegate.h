//
//  ppatAppDelegate.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/11/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ppatStep.h"
#import "ppatToDoItem.h"

@interface ppatAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(NSArray *)getTaskWithName:(NSString *)taskName;
-(NSArray *)getAllTasks;
-(void)insertNewTask:(ppatToDoItem *)task withSteps:(NSArray *)steps;
-(BOOL)deleteStep:(ppatStep *)step;
@end
