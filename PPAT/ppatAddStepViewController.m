//
//  ppatAddStepViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 11/30/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatAddStepViewController.h"

@interface ppatAddStepViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *textField;
    @property (weak, nonatomic) IBOutlet UIButton *cancelButton;
    @property (weak, nonatomic) IBOutlet UIButton *saveStepButton;
@end

@implementation ppatAddStepViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if the save step button is not pressed return without doing anything.
    if (sender != self.saveStepButton) return;
    if (self.textField.text.length > 0) {
        self.thisStep = [[ppatStep alloc] init];
        self.thisStep.stepText = self.textField.text;
        self.thisStep.completed = NO;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"AddStepView: viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
