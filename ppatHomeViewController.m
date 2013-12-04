//
//  ppatHomeViewController.m
//  PPAT
//
//  Created by Tara Krishnan on 12/4/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import "ppatHomeViewController.h"

@interface ppatHomeViewController ()

@end

@implementation ppatHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"HLKJHLKJHKLH");
    NSLog(nibNameOrNil);
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
    NSArray *marlaGreetings = @[@"Hi Marla,",@"Hi there Marla,", @"Greetings Marla,", @"Hey Marla,", @"Hey there Marla,", @"Howdy Marla,", @"What's up Marla,"];
    NSArray *marlaPickMeUps = @[@"Carpe Diem!", @"You can do it!", @"I believe in you!", @"You've got this!", @"You're doing great!", @"Each day is a new beginning!", @"Each day is a blessing!", @"Looking good today!"];
    
    NSUInteger randIndexOne = arc4random() % [marlaGreetings count];
    self.greetingText.text = marlaGreetings[randIndexOne];
    
    NSUInteger randIndexTwo = arc4random() % [marlaPickMeUps count];
    
    self.pickMeUpText.text = marlaPickMeUps[randIndexTwo];
    
    [self.pickMeUpText sizeThatFits:CGSizeMake(320, 64)];[self.pickMeUpText sizeToFit];
    
    NSDate *todayDate = [NSDate date];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    
    [dateFormater setDateStyle: NSDateFormatterFullStyle];
    [dateFormater setTimeStyle:NSDateFormatterShortStyle];
    
    NSString *dateText = [dateFormater stringFromDate:todayDate];
    NSArray *dateItems = [dateText componentsSeparatedByString:@" at "];
    self.currentDateText.text = dateItems[0];
    self.currentTimeText.text = dateItems[1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
