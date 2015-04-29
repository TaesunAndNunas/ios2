//
//  MainViewController.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

static NSInteger feedingCount = 0;
static NSInteger pooCount = 0;
static NSInteger sleepingCount = 0;
static NSInteger medicineCount = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _feedingArr  = [[NSMutableArray alloc]init];
//    _pooArr      = [[NSMutableArray alloc]init];
//    _sleepingArr = [[NSMutableArray alloc]init];
//    _medicineArr = [[NSMutableArray alloc]init];
    _totalArr    = [[NSMutableArray alloc]init];
    _mainTableView.dataSource = self;
    [_mainTableView reloadData];
    [self downloadUsingSync];
}

- (void) downloadUsingSync{
    //NSURL *url = [NSURL URLWithString:(NSString 190-0ㄴㅈ`*) relativeToURL:<#(NSURL *)#>];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://127.0.0.1:9999/cardList"];
    NSLog(@"URL=%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //Request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1/cardList"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //Response
    NSURLResponse *resp = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_totalArr count];
}

- (MainTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cIdentifier = @"cell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cIdentifier];
    
    if(cell ==nil){
        cell = [[MainTableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cIdentifier];
    }
    
    cell.textLabel.text = [_totalArr objectAtIndex:_totalArr.count -1 -indexPath.row];

    return cell;
}

    
//- (void)removeAllObjects {
//    12:00 am
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Getter/Setter for count

+ (NSInteger)feedingCount{
    return feedingCount;
}

+ (void) setFeedingCount:(NSInteger)count{
    feedingCount = count;
}

+ (NSInteger) pooCount{
    return pooCount;
}

+ (void) setPooCount:(NSInteger)count{
    pooCount = count;
}

+ (NSInteger) sleepingCount{
    return sleepingCount;
}

+ (void) setSleepingCount:(NSInteger)count{
    sleepingCount = count;
}

+ (NSInteger) medicineCount{
    return medicineCount;
}

+ (void) setMedicineCount:(NSInteger)count{
    medicineCount = count;
}

// action time in array
// action count == last array idx
// or dic
// action time + count == MutableString appendFormat

#pragma mark - Main View Button Action

- (IBAction)feedingButton:(id)sender {

    feedingCount++;

    NSDate* now = [NSDate date];
    NSDateFormatter* hourAndMin = [[NSDateFormatter alloc]init];
    [hourAndMin setDateFormat:@"HH:mm"];
    NSString* actionTime = [hourAndMin stringFromDate:now];
    
    NSMutableString* textForLabel = [[NSMutableString alloc]initWithCapacity:10];
    [textForLabel appendFormat:@"%ld회 / ", (long)feedingCount];
    [textForLabel appendFormat:@"%@", actionTime];
    _feedingLabel.text = textForLabel;
    
    NSString* textSendToArray = [[NSString alloc]initWithFormat:@"feeding / %@",actionTime];
    [_totalArr addObject:textSendToArray];
    [_mainTableView reloadData];
    NSLog(@"%@ / %ld",textSendToArray, (long)feedingCount);
}

- (IBAction)pooButton:(id)sender {
    
    pooCount++;

    NSDate* now = [NSDate date];
    NSDateFormatter* hourAndMin = [[NSDateFormatter alloc]init];
    [hourAndMin setDateFormat:@"HH:mm"];
    NSString* actionTime = [hourAndMin stringFromDate:now];
    
    NSMutableString* textForLabel = [[NSMutableString alloc]initWithCapacity:10];
    [textForLabel appendFormat:@"%ld회 / ", (long)pooCount];
    [textForLabel appendFormat:@"%@", actionTime];
    _pooLabel.text = textForLabel;
    
    NSString* textSendToArray = [[NSString alloc]initWithFormat:@"poo / %@",actionTime];
    [_totalArr addObject:textSendToArray];
    [_mainTableView reloadData];
    NSLog(@"%@ / %ld",textSendToArray, (long)pooCount);
}

- (IBAction)sleepingButton:(id)sender {
    
    sleepingCount++;

    NSDate* now = [NSDate date];
    NSDateFormatter* hourAndMin = [[NSDateFormatter alloc]init];
    [hourAndMin setDateFormat:@"HH:mm"];
    NSString* actionTime = [hourAndMin stringFromDate:now];
    
    NSMutableString* textForLabel = [[NSMutableString alloc]initWithCapacity:10];
    [textForLabel appendFormat:@"%ld회 / ", (long)sleepingCount];
    [textForLabel appendFormat:@"%@", actionTime];
    _sleepingLabel.text = textForLabel;
    
    NSString* textSendToArray = [[NSString alloc]initWithFormat:@"sleeping / %@",actionTime];
    [_totalArr addObject:textSendToArray];
    [_mainTableView reloadData];
    NSLog(@"%@ / %ld",textSendToArray, (long)sleepingCount);
}

- (IBAction)medicineButton:(id)sender {
    
    medicineCount++;

    NSDate* now = [NSDate date];
    NSDateFormatter* hourAndMin = [[NSDateFormatter alloc]init];
    [hourAndMin setDateFormat:@"HH:mm"];
    NSString* actionTime = [hourAndMin stringFromDate:now];
    
    NSMutableString* textForLabel = [[NSMutableString alloc]initWithCapacity:10];
    [textForLabel appendFormat:@"%ld회 / ", (long)medicineCount];
    [textForLabel appendFormat:@"%@", actionTime];
    _medicineLabel.text = textForLabel;
    
    NSString* textSendToArray = [[NSString alloc]initWithFormat:@"medicine / %@",actionTime];
    [_totalArr addObject:textSendToArray];
    [_mainTableView reloadData];
    NSLog(@"%@ / %ld",textSendToArray, (long)medicineCount);
}


@end

// 4개 버튼 클릭시 라벨에 1일기준 횟수, 마지막 시간 띄우기, 테이블 셀 추가