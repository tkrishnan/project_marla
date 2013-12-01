//
//  ppatAddToDoItemViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatAddToDoItemViewController.h"
#import "ppatAddStepViewController.h"


@interface ppatAddToDoItemViewController ()

@end

@implementation ppatAddToDoItemViewController
@synthesize toDoItem, stepsTableView, addStepButton, textField, doneButton;

- (IBAction)unwindToAddTask:(UIStoryboardSegue *)segue
{
    ppatAddStepViewController *source = [segue sourceViewController];
    ppatStep *step = source.thisStep;
    if (step != nil) {
        [self.taskStepsArray addObject:step];
        [self.stepsTableView reloadData];

    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
        self.toDoItem = [[ppatToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)viewDidLoad{
    NSLog(@"AddToDoItem: viewDidLoad");
	//Set TableView Delegate/DataSource to self
    [super viewDidLoad];
    stepsTableView.delegate = self;
    stepsTableView.dataSource = self;
    self.taskStepsArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"AddToDoItem: numberOfRowsInSection");
    return [self.taskStepsArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"AddToDoItem: numberOfSectionsInTableView");
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"AddToDoItem: cellForRowAtIndexPath");
    static NSString *simpleTableIdentifier = @"StepCell";
    UITableViewCell *thisCell = [stepsTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    ppatStep *currStep = [self.taskStepsArray objectAtIndex:indexPath.row];
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
    
    [stepsTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *selectedString = [self.taskStepsArray objectAtIndex:indexPath.row];
    
    NSLog(@"test item %@", selectedString);
    
}



@end
