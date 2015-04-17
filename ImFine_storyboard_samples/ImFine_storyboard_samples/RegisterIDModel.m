//
//  RegisterIDModel.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 8..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "RegisterIDModel.h"

@implementation RegisterIDModel
{
    RegisterIDViewController* newController;
}

- (id) init {
    
    self = [super init];
    if (self) {
        newController = [[RegisterIDViewController alloc]init];
    }
    return self;
}


- (id) initWithURLWithPort:(NSString*)URL port:(NSString*)port {
    
    if ([super init]) {
        NSString* serverAddress = [NSString stringWithFormat:@"http://%@:%@", URL, port];
        newURL = [[NSURL alloc]initWithString:serverAddress];
        newRequest = [[NSMutableURLRequest alloc]initWithURL:newURL];
        newRequest.HTTPMethod = @"POST";
    }
    return self;
}


-(void) successConnection:(NSString*)userID
                         :(NSString*)password
                         :(NSString*)userName
                         :(NSString*)userBirth
                         :(NSString*)userSex {
    
    [newRequest setURL:[newURL URLByAppendingPathComponent:@"/regist"]];
    NSLog(@"current connected URL : %@", newRequest.URL);
    resistData = [[NSString stringWithFormat:@"userID=%@&password=%@&userName=%@&userBirth=%@",userID,password,userName,userBirth]
                  dataUsingEncoding:NSUTF8StringEncoding];
    [newRequest setHTTPBody:resistData];
    
    NSHTTPURLResponse* sResponse;
    NSError* error;
    resistData = [NSURLConnection sendSynchronousRequest:newRequest returningResponse:&sResponse error:&error];
    NSLog(@"Response success : %@",sResponse);
    
    NSUserDefaults* pref = [NSUserDefaults standardUserDefaults];
    NSDictionary* dictionary;
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)sResponse;
    if ([sResponse respondsToSelector:@selector(allHeaderFields)]) {
        dictionary = [httpResponse allHeaderFields];
    }
    
    NSArray* keys = [dictionary allKeys];
    NSString* rememberToken;
    if([keys containsObject:@"Set-Cookie"] == YES){
        NSString * cookie_str = [[dictionary valueForKey:@"Set-Cookie"]stringByReplacingOccurrencesOfString:@"Path=/,"
                                                                                                 withString:@""];
        NSArray * cookie_arr = [cookie_str componentsSeparatedByString:@";"];
        rememberToken = [[[cookie_arr objectAtIndex:0] componentsSeparatedByString:@"="] objectAtIndex:1];
        NSString * session = [[[cookie_arr objectAtIndex:2] componentsSeparatedByString:@"="] objectAtIndex:1];
        [pref setObject:rememberToken forKey : @"remember_token"];
        [pref setObject:session forKey : @"session"];
        [pref synchronize];
    }
    [newRequest setValue:[NSString stringWithFormat:@"remember_token=%@",rememberToken]
      forHTTPHeaderField:@"Cookie"];
}


- (BOOL) checkUserIDDuplicated:(NSString*)userID {
    
    [newRequest setURL:[newURL URLByAppendingPathComponent:@"/regist/userID"]];
    NSLog(@"current connected URL : %@", newRequest.URL);
    resistData = [[NSString stringWithFormat:@"current User Id : %@",userID] dataUsingEncoding:NSUTF8StringEncoding];
    [newRequest setHTTPBody:resistData];
    
    NSHTTPURLResponse* sResponse;
    NSError* error;
    
    resistData = [NSURLConnection sendSynchronousRequest:newRequest returningResponse:&sResponse error:&error];
    NSString* result = [NSString stringWithUTF8String:resistData.bytes];
    NSLog(@"response = %ld", (long)sResponse.statusCode);
    NSLog(@"result = %@", [NSString stringWithUTF8String:resistData.bytes]);
    
    if ([result isEqual: @"None"]){
        return YES;
    } else return NO;
}

@end
