//
//  ppatStepThroughTaskViewController.h
//  PPAT
//
//  Created by Anuhya Ghorakavi on 12/1/13.
//  Copyright (c) 2013 Anuhya Ghorakavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ppatToDoItem.h"

@interface ppatStepThroughTaskViewController : UIViewController
    @property (weak, nonatomic) ppatToDoItem *currItem;
    @property (weak, nonatomic) IBOutlet UILabel *stepText;
    @property (weak, nonatomic) IBOutlet UILabel *stepNumber;
    @property (weak, nonatomic) IBOutlet UIButton *nextStep;
    @property (weak, nonatomic) IBOutlet UIButton *previousStep;
@end
