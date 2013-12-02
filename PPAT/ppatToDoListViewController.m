//
//  ppatToDoListViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/24/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatToDoListViewController.h"
#import "ppatAddToDoItemViewController.h"
#import "ppatOptionViewController.h"
#import "ppatToDoItem.h"
#import "ppatAppDelegate.h"

@interface ppatToDoListViewController ()
    @property NSMutableArray *toDoItems;
@end

@implementation ppatToDoListViewController

- (void)loadInitialData {
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    ppatAddToDoItemViewController *source = [segue sourceViewController];
    ppatToDoItem *item = source.toDoItem;
    item.stepsList = source.taskStepsArray;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (IBAction)unwindFromOptionToMain:(UIStoryboardSegue *)segue
{
    ppatOptionViewController *source = [segue sourceViewController];
}

- (IBAction)unwindFromViewToMain:(UIStoryboardSegue *)segue
{
    ppatOptionViewController *source = [segue sourceViewController];
}

- (IBAction)unwindFromStepToMain:(UIStoryboardSegue *)segue
{
    ppatOptionViewController *source = [segue sourceViewController];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    //this code makes the red minus signs appear on the page
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ppatToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ToDolistView: didSelectRowAtIndexPath");
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ToDolistView: prepareForSegue");
    if ([segue.identifier isEqualToString:@"selectSingleTask"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ppatOptionViewController *destViewController = segue.destinationViewController;
        NSLog(@"ToDolistView: prepareForSegue selected item %@", [[self.toDoItems objectAtIndex:indexPath.row] itemName]);
        destViewController.taskName = [[self.toDoItems objectAtIndex:indexPath.row] itemName];
        destViewController.currItem =[self.toDoItems objectAtIndex:indexPath.row];
    }
    
}






@end
