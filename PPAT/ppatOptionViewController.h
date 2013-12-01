//
//  ppatOptionViewController.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//
#import "ppatToDoItem.h"
#import <UIKit/UIKit.h>
@interface ppatOptionViewController : UIViewController
//  task name will be taken from previous page to display on the page
    @property (nonatomic, weak) NSString *taskName;
    @property (weak, nonatomic) IBOutlet UILabel *taskTitle;
    @property (weak, nonatomic) IBOutlet UIButton *viewTaskButton;
    @property (weak, nonatomic) IBOutlet UIButton *stepThroughButton;
    @property (weak, nonatomic) ppatToDoItem *currItem;
@end
