//
//  FeedingViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *feedingAmountBottleField;
@property (strong, nonatomic) IBOutlet UITextField *feedingTimeHourField;
@property (strong, nonatomic) IBOutlet UITextField *feddingTimeMinuteField;
@property (strong, nonatomic) IBOutlet UITextField *feedingDirectDuration;
@property (strong, nonatomic) IBOutlet UISegmentedControl *feedingWaySegmented;
@property (strong, nonatomic) IBOutlet UITextField *feedingMemoField;

- (IBAction)cancleButton:(id)sender;
- (IBAction)saveButton:(id)sender;

@end
