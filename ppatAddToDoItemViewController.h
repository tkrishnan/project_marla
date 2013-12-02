//
//  ppatAddToDoItemViewController.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ppatToDoItem.h"
#import "ppatStep.h"


@interface ppatAddToDoItemViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

    @property NSMutableArray *taskStepsArray;
    @property ppatToDoItem *toDoItem;
    @property (strong, nonatomic) IBOutlet UIButton *addStepButton;
    @property (weak, nonatomic) IBOutlet UITextField *textField;
    @property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
    @property (weak, nonatomic) IBOutlet UITableView *stepsTableView;

@end
