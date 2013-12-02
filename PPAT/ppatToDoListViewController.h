//
//  ppatToDoListViewController.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ppatToDoListViewController : UITableViewController <UIAlertViewDelegate>
    @property(nonatomic, readonly) NSInteger numberOfButtons;
    @property(nonatomic, copy) NSString *message;
    @property(nonatomic, copy) NSString *title;
    @property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@end

