//
//  ppatStepThroughTaskViewController.m
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatStepThroughTaskViewController.h"
#import "ppatStep.h"
#import "ppatToDoItem.h"

@interface ppatStepThroughTaskViewController ()
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;
@end

@implementation ppatStepThroughTaskViewController

@synthesize currItem, stepText, stepNumber, nextStep, previousStep;
int count;

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
    count=0;
    UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:2];
    navCon.navigationItem.title =currItem.itemName;
    NSString *step = @"Step ";
    NSString *strFromInt = [NSString stringWithFormat:@"%d", count+1];
    stepNumber.text = [[[step stringByAppendingString:strFromInt] stringByAppendingString:@" of "] stringByAppendingFormat:@"%d", [currItem.stepsList count]];
    ppatStep *temp = [currItem.stepsList objectAtIndex:count];
    NSMutableString *temp_string = [NSMutableString stringWithString:temp.stepText];
    NSLog(@"%@", temp_string);
    [temp_string appendString:@"?"];
    [UIView animateWithDuration:1.5 animations:^{
        stepText.alpha = 0.0;
    }];
    stepText.text = temp_string;
    [UIView animateWithDuration:1.5 animations:^{
        stepText.alpha = 1.0;
    }];
    [stepText sizeThatFits:CGSizeMake(280, 80)];[stepText sizeToFit];
    previousStep.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeNavBarDetails{
    UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:2];
    navCon.navigationItem.title = currItem.itemName;
    NSLog(@"%@", currItem);
    ppatStep *temp = [currItem.stepsList objectAtIndex:count];
    NSString *temp_string = temp.stepText;
    NSLog(@"%@", temp_string);
    stepText.text = temp_string;
    
}

- (IBAction)nextStep:(id)sender {
    if (count + 1 != [currItem.stepsList count]){
        count = count + 1;
        NSString *step = @"Step ";
        NSString *strFromInt = [NSString stringWithFormat:@"%d", count+1];
        stepNumber.text = [[[step stringByAppendingString:strFromInt] stringByAppendingString:@" of "] stringByAppendingFormat:@"%d", [currItem.stepsList count]];
        ppatStep *temp = [currItem.stepsList objectAtIndex:count];
        NSMutableString *temp_string = [NSMutableString stringWithString:temp.stepText];
        NSLog(@"%@", temp_string);
        [temp_string appendString:@"?"];
        [UIView animateWithDuration:1.5 animations:^{
            stepText.alpha = 0.0;
        }];
        stepText.text = temp_string;
        [UIView animateWithDuration:1.5 animations:^{
            stepText.alpha = 1.0;
        }];
        [stepText sizeThatFits:CGSizeMake(280, 80)];
        if (previousStep.hidden){
            previousStep.hidden = NO;
        }
    }
    else{
        count = count + 1;
        stepText.text = @"";
        stepNumber.text = @"Congratulations on Successfully Walking Through This Task!";
        stepNumber.numberOfLines = 0;
        [stepNumber sizeToFit];
        nextStep.hidden = YES;
    }
}

- (IBAction)previousStep:(id)sender {
    if (nextStep.hidden){
        nextStep.hidden = NO;
    }
    if (count - 1  >= 0){
        count = count - 1;
        NSString *step = @"Step ";
        NSString *strFromInt = [NSString stringWithFormat:@"%d", count+1];
        stepNumber.text = [[[step stringByAppendingString:strFromInt] stringByAppendingString:@" of "] stringByAppendingFormat:@"%d", [currItem.stepsList count]];
        ppatStep *temp = [currItem.stepsList objectAtIndex:count];
        NSMutableString *temp_string = [NSMutableString stringWithString:temp.stepText];
        NSLog(@"%@", temp_string);
        [temp_string appendString:@"?"];
        [UIView animateWithDuration:1.5 animations:^{
            stepText.alpha = 0.0;
        }];
        stepText.text = temp_string;
        [UIView animateWithDuration:1.5 animations:^{
            stepText.alpha = 1.0;
        }];

        [stepText sizeThatFits:CGSizeMake(280, 80)];
        if (count ==0){
            previousStep.hidden = YES;
        }
    }
}
@end
