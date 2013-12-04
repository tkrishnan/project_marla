//
//  ppatAppDelegate.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/11/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatAppDelegate.h"
#import "ppatToDoItem.h"
#import "ppatStep.h"

@implementation ppatAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSManagedObjectContext *) managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return _managedObjectContext;
}

//2
- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}

//3
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"TaskDB.sqlite"]];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return _persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSArray *)getTaskWithName:(NSString *)taskName
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TodoItem"
                                              inManagedObjectContext:self.managedObjectContext];
    
    NSPredicate *query = [NSPredicate predicateWithFormat:@"(itemName=%@)", taskName];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:query];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
}

- (NSArray *)getAllTasks
{
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem"
                                              inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
    
}

- (void)insertNewTask:(ppatToDoItem *)task withSteps:(NSArray *)steps
{
//    ppatToDoItem * newTask = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem"
//                                                      inManagedObjectContext:self.managedObjectContext];
//    //  TODO: clean
//    newTask.itemName = task.itemName;
//    newTask.completed = NO;
//
//    NSMutableArray *stepArray = [NSMutableArray array];
//    
//    //iterate and make Step
//    [steps enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        ppatStep *step = [NSEntityDescription insertNewObjectForEntityForName:@"Step" inManagedObjectContext:self.managedObjectContext];
//        
//        ppatStep * stepToCopy = obj;
//        step.stepText = stepToCopy.stepText;
//        step.stepNumber = stepToCopy.stepNumber;
//        step.completed = NO;
//        
//        [stepArray addObject:step];
//        
//    }];
    
    task.stepSet = [NSSet setWithArray:steps];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

}

-(BOOL)deleteStep:(ppatStep *)step
{
    [self.managedObjectContext deleteObject:step];
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}

-(BOOL)deleteTask:(ppatToDoItem *)toBeDeleted
{
    [toBeDeleted.stepSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [self.managedObjectContext deleteObject:obj];
    }];
    [self.managedObjectContext deleteObject:toBeDeleted];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}

@end
