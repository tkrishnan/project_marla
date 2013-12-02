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
#import "ppatAddStepViewController.h"
#import "ppatAppDelegate.h"

@interface ppatViewTaskViewController ()
    - (IBAction)editTable:(id)sender;
@end

@implementation ppatViewTaskViewController
@synthesize currItem, stepsTable, saveTaskButton, editTaskButton, cancelButton, taskTitle;

- (IBAction)unwindToAddTask:(UIStoryboardSegue *)segue
{
    ppatAddStepViewController *source = [segue sourceViewController];
    ppatStep *step = source.thisStep;
    if (step != nil) {
        [self.currItem.stepsList addObject:step];
        [self.stepsTable reloadData];
    }
}

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
    NSLog(@"i am editing");
    [stepsTable deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableview isEditing]){
        NSLog(@"ING");
        [tableview setEditing:NO animated:YES];
    }
    else{
        NSLog(@"NOT NOT");
        
        [tableview setEditing:YES animated:YES];
    }
}

- (void)tableView: (UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath: (NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the step from the data source
        ppatAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        [appDelegate deleteStep:[currItem.stepsList objectAtIndex:[indexPath row]]];
        [currItem refreshStepsList];
        // Delete row using the cool literal version of [NSArray arrayWithObject:indexPath]
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    if ([tableView isEditing]){
        NSLog(@"ING");
        [tableView setEditing:NO animated:YES];
    }
    else{
        NSLog(@"NOT NOT");
        
        [tableView setEditing:YES animated:YES];
        [tableView reloadData];
    }
}

@end