//
//  TodayViewController.h
//  ImFineWidget
//
//  Created by 박태준 on 2015. 6. 1..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController

- (IBAction)feedingButton:(id)sender;
- (IBAction)pooButton:(id)sender;
- (IBAction)sleepingButton:(id)sender;
- (IBAction)medicineButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *feedingLabel;
@property (strong, nonatomic) IBOutlet UILabel *pooLabel;
@property (strong, nonatomic) IBOutlet UILabel *sleepingLabel;
@property (strong, nonatomic) IBOutlet UILabel *medicineLabel;

@end
