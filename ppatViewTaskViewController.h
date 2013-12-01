//
//  ppatViewTaskViewController.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ppatToDoItem.h"

@interface ppatViewTaskViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
    @property (weak, nonatomic) ppatToDoItem *currItem;
    @property (weak, nonatomic) IBOutlet UITableView *stepsTable;
    @property (weak, nonatomic) IBOutlet UIBarButtonItem *saveTaskButton;
    @property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
    @property (weak, nonatomic) IBOutlet UILabel *taskTitle;

@end
