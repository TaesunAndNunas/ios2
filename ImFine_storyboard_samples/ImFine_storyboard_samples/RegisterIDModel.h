//
//  RegisterIDModel.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 8..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterIDViewController.h"

@interface RegisterIDModel : NSObject
{
    NSURL* newURL;
    NSMutableURLRequest * newRequest;
    NSData * resistData;
}

- (id) init;
- (id) initWithURLWithPort:(NSString*)URL
                      port:(NSString*)port;
-(void) successConnection:(NSString*)userID
                         :(NSString*)password
                         :(NSString*)userName
                         :(NSString*)userBirth
                         :(NSString*)userSex;
- (BOOL) checkUserIDDuplicated:(NSString*)userID;

@end
