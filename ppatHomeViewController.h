//
//  ppatHomeViewController.h
//  PPAT
//
//  Created by Tara Krishnan on 12/4/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ppatHomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *greetingText;
@property (weak, nonatomic) IBOutlet UILabel *pickMeUpText;
@property (weak, nonatomic) IBOutlet UILabel *currentDateText;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeText;

@end
