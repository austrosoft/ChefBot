//
//  CBNetworkConnection.m
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import "CBNetworkConnection.h"

NSString *const YUMMLY_APP_ID   = @"f3c23087";
NSString *const YUMMLY_APP_KEY  = @"a650d345ceda46539a4c8f605ad65e79";
NSString *const CBNetworkConnectionAddress = @"http://api.yummly.com/v1/api/recipes?";

@implementation CBNetworkConnection


+ (instancetype)networkConnection
{
    return [[self alloc] init];
}

@end
