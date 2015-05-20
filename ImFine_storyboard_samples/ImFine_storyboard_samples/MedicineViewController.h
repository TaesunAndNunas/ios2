//
//  MedicineViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicineViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *medicineTimeHourField;
@property (strong, nonatomic) IBOutlet UITextField *medicineTimeMinuteField;
@property (strong, nonatomic) IBOutlet UITextField *medicineMemoField;

- (IBAction)medicineFeverButton:(id)sender;
- (IBAction)medicineCoughButton:(id)sender;
- (IBAction)medicineRunnyNoseButton:(id)sender;
- (IBAction)medicineVomitButton:(id)sender;
- (IBAction)cancleButton:(id)sender;
- (IBAction)saveButton:(id)sender;

@end
