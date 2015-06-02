//
//  FeedingViewController.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "FeedingViewController.h"

@interface FeedingViewController ()

@end

@implementation FeedingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //디폴트시간 이벤트타임
    //입력값 제이슨 처리
    //세그멘티드 컨트롤 처리
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancleButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
