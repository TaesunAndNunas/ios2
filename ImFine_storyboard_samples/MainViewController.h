//
//  MainViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewCell.h"
#import "MainModel.h"

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (IBAction)feedingButton:(id)sender;
- (IBAction)pooButton:(id)sender;
- (IBAction)sleepingButton:(id)sender;
- (IBAction)medicineButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) IBOutlet UILabel *feedingLabel;
@property (strong, nonatomic) IBOutlet UILabel *pooLabel;
@property (strong, nonatomic) IBOutlet UILabel *sleepingLabel;
@property (strong, nonatomic) IBOutlet UILabel *medicineLabel;

//@property (strong, nonatomic) NSMutableArray* feedingArr;
//@property (strong, nonatomic) NSMutableArray* pooArr;
//@property (strong, nonatomic) NSMutableArray* sleepingArr;
//@property (strong, nonatomic) NSMutableArray* medicineArr;

@property (strong, nonatomic) NSMutableArray* totalArr;

+ (NSInteger) feedingCount;
+ (NSInteger) pooCount;
+ (NSInteger) sleepingCount;
+ (NSInteger) medicineCount;

+ (void) setFeedingCount:(NSInteger)count;
+ (void) setPooCount:(NSInteger)count;
+ (void) setSleepingCount:(NSInteger)count;
+ (void) setMedicineCount:(NSInteger)count;

@end
