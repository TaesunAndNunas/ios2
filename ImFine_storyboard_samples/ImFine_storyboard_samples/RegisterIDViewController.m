//
//  RegisterIDViewController.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "RegisterIDViewController.h"

@interface RegisterIDViewController ()

{
    RegisterIDModel* newModel;
}

@end

@implementation RegisterIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    newModel = [[RegisterIDModel alloc] initWithURLwithPort:서버주소 port:포트번호];
    _errorLabel.text = @"";
//    탭부분
    
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


// 아이디 유효판별 검사 메서드
-(BOOL) checkUserIDValid: (NSString*) userID {
    
    NSPredicate* validate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z0-9]*$"];
    BOOL isPass = [validate evaluateWithObject: userID];
    return isPass;

//    const char *tmp = [userID cStringUsingEncoding:NSUTF8StringEncoding];
//    if (userID.length != strlen(tmp)) {
//        return NO;
//    }
//    NSString *check = @"[A-Za-z0-9]*$";
//    NSRange match = [userID rangeOfString:check options:NSRegularExpressionSearch];
//    if (NSNotFound == match.location) {
//        return NO;
//    }
//    return YES;
}


- (IBAction)userSexSegmented:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.userSex = @"male";
            NSLog(@"Choose male");
            break;
        case 1:
            self.userSex = @"female";
            NSLog(@"Choose female");
            break;
        default: 
            break; 
    }
}


-(BOOL) checkSuccess {
    
    NSString *userID =  [self.userIDField text];
    NSString *pw1 =     [self.userPassword1Field text];
    NSString *pw2 =     [self.userPassword2Field text];
    NSString *name =    [self.userNameField text];
    NSString *birth =   [self.userBirthField text];
    
    // ID 관련 예외처리
    if([userID isEqualToString:@""]){
        self.errorLabel.text = @"아이디는 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    if (![self checkUserIDValid:userID]) {
        self.errorLabel.text = @"아이디는 알파벳 소문자 또는 숫자의 조합으로 작성해 주세요";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    if (![newModel checkUserIDDuplicated: userID]) {
        self.errorLabel.text = @"중복된 아이디가 존재합니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }

    // 비밀번호 관련 예외처리
    if([pw1 isEqualToString:@""]){
        self.errorLabel.text = @"비밀번호는 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    if([pw2 isEqualToString:@""]){
        self.errorLabel.text = @"비밀번호 확인은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    if (![pw1 isEqualToString:pw2]) {
        self.errorLabel.text = @"비밀번호가 일치하지 않습니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    // 이름 관련 예외처리
    if([name isEqualToString:@""]){
        self.errorLabel.text = @"아이의 이름은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    // 생년월일 관련 예외처리
    if([birth isEqualToString:@""]){
        self.errorLabel.text = @"아이의 생년월일은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return NO;
    }
    
    self.errorLabel.textColor = [UIColor blueColor];
    self.errorLabel.text = @"입력 완료";
    return YES;
}


- (IBAction)registButton:(id)sender {
    
        NSString *userID =    [self.userIDField text];
        NSString *password =  [self.userPassword1Field text];
        NSString *userName =  [self.userNameField text];
        NSString *userBirth = [self.userBirthField text];
    
        if ([self checkSuccess]) {
            [newModel successConnection:userID
                                       :password
                                       :userName
                                       :userBirth
                                       :_userSex];
        }
}
@end

// 아이디 비밀번호 확인 이름 생년월일 넘김
// 성별 프로필사진 넘김
// 양식 필터링 및 얼라트
// 중복검사