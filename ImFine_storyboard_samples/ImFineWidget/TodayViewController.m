//
//  TodayViewController.m
//  ImFineWidget
//
//  Created by 박태준 on 2015. 6. 1..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (IBAction)feedingButton:(id)sender {
    

}

- (IBAction)pooButton:(id)sender {
    
}

- (IBAction)sleepingButton:(id)sender {
    
}

- (IBAction)medicineButton:(id)sender {
    
}

@end
