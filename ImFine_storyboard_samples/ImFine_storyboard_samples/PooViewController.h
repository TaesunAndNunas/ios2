//
//  PooViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PooViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *pooTimeHourField;
@property (strong, nonatomic) IBOutlet UITextField *pooTimeMinuteField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *pooTypeSegmented;
@property (strong, nonatomic) IBOutlet UISegmentedControl *pooConditionSegmented;
@property (strong, nonatomic) IBOutlet UITextField *pooMemoField;

- (IBAction)pooPictureButton:(id)sender;
- (IBAction)cancleButton:(id)sender;
- (IBAction)saveButton:(id)sender;

@end
