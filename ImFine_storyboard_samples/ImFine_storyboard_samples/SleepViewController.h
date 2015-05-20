//
//  SleepViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SleepViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *sleepTimeStartHourField;
@property (strong, nonatomic) IBOutlet UITextField *sleepTimeStartMinuteField;
@property (strong, nonatomic) IBOutlet UITextField *sleepTimeEndHourField;
@property (strong, nonatomic) IBOutlet UITextField *sleepTimeEndMinuteField;
@property (strong, nonatomic) IBOutlet UITextField *sleepMemoField;

- (IBAction)cancleButton:(id)sender;
- (IBAction)saveButton:(id)sender;

@end
