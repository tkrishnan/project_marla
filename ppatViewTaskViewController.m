//
//  ppatViewTaskViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatViewTaskViewController.h"
#import "ppatToDoItem.h"
#import "ppatStep.h"

@interface ppatViewTaskViewController ()

@end

@implementation ppatViewTaskViewController
@synthesize currItem, stepsTable, saveTaskButton, cancelButton, taskTitle;
//
//- (IBAction)unwindToAddTask:(UIStoryboardSegue *)segue
//{
//    ppatViewTaskViewController *source = [segue sourceViewController];
//    ppatStep *step = source.thisStep;
//    if (step != nil) {
//        [self.taskStepsArray addObject:step];
//        [self.stepsTableView reloadData];
//        
//    }
//}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    stepsTable.delegate = self;
    stepsTable.dataSource = self;
    taskTitle.text = currItem.itemName;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"ViewTask: numberOfRowsInSection");
    return [currItem.stepsList count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"ViewTask: numberOfSectionsInTableView");
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"AddToDoItem: cellForRowAtIndexPath");
    static NSString *simpleTableIdentifier = @"ViewTaskCell";
    UITableViewCell *thisCell = [stepsTable dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    ppatStep *currStep = [currItem.stepsList objectAtIndex:indexPath.row];
    NSLog(@"current step %@", currStep.stepText );
    int index = indexPath.row;
    index = index + 1;
    NSString *value = [NSString stringWithFormat:@"%d. ", index];
    value = [value stringByAppendingString:currStep.stepText];
    thisCell.textLabel.text = value;
    return thisCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}

-(void)tableView:(UITableView *)tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [stepsTable deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *selectedString = [currItem.stepsList objectAtIndex:indexPath.row];
    
    NSLog(@"test item %@", selectedString);
    
}


@end
