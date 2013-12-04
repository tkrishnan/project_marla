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
    
    [UIView animateWithDuration:.1 animations:^{
        self.greetingText.alpha = 0.0;
        
        self.pickMeUpText.alpha = 0.0;
        
        self.currentDateText.alpha = 0.0;
        self.currentTimeText.alpha = 0.0;
        self.todayText.alpha = 0.0;
        
        self.taskListButton.alpha = 0.0;
    }];
    
    self.greetingText.center = CGPointMake(self.greetingText.center.x, self.greetingText.center.y + 20);
    self.pickMeUpText.center = CGPointMake(self.pickMeUpText.center.x, self.pickMeUpText.center.y - 20);
    self.todayText.center = CGPointMake(self.todayText.center.x -5, self.todayText.center.y);
    
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
    
    [UIView animateWithDuration:2.0 animations:^{
        self.greetingText.alpha = 1.0;
        self.greetingText.center = CGPointMake(self.greetingText.center.x, self.greetingText.center.y - 20);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 animations:^{
            self.todayText.alpha = 1.0;
            self.todayText.center = CGPointMake(self.todayText.center.x +5, self.todayText.center.y);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2.0 animations:^{
                self.currentDateText.alpha = 1.0;
                self.currentTimeText.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.5 animations:^{
                    self.pickMeUpText.alpha = 1.0;
                    self.pickMeUpText.center = CGPointMake(self.pickMeUpText.center.x, self.pickMeUpText.center.y + 20);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.0 animations:^{
                        self.taskListButton.alpha = 1.0;
                    }];
                }];
            }];
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
