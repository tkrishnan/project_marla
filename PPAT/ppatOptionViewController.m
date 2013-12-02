//
//  ppatOptionViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatOptionViewController.h"
#import "ppatStepThroughTaskViewController.h"
#import "ppatViewTaskViewController.h"
#import "ppatToDoItem.h"

@interface ppatOptionViewController ()

@end

@implementation ppatOptionViewController
@synthesize currItem, taskName, taskTitle, viewTaskButton, stepThroughButton;


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
    NSLog(@"OptionViewController: viewDidLoad");
    [super viewDidLoad];
    taskTitle.text = taskName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Option: prepareForSegue");
    if ([segue.identifier isEqualToString:@"stepThroughTask"]) {
        NSLog(@"Option: prepareForSegue stepThroughTask");
        ppatStepThroughTaskViewController *destViewController = segue.destinationViewController;
        destViewController.currItem = currItem;
    }
    if ([segue.identifier isEqualToString:@"viewTask"]) {
        NSLog(@"Option: viewTask");
        ppatViewTaskViewController *destViewController = segue.destinationViewController;
        destViewController.currItem = currItem;
    }
}
@end
