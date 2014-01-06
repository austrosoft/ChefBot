//
//  CBNetworkConnection.m
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import "CBNetworkConnectionDelegate.h"

NSString *const YUMMLY_APP_ID   = @"f3c23087";
NSString *const YUMMLY_APP_KEY  = @"a650d345ceda46539a4c8f605ad65e79";
NSString *const CBNetworkConnectionAddress = @"http://api.yummly.com/v1/api/recipes?";

@interface CBNetworkConnection()


@end

@implementation CBNetworkConnection


+ (instancetype)networkConnection {
    return [[self alloc] init];
}

- (void)createNewConnection:(NSString *)command parameters:(id)parameters
{

   [self setResponseData:[NSMutableData data]];
    NSString * tempURLString = @"http://api.yummly.com/v1/api/recipes?_app_id=f3c23087&_app_key=a650d345ceda46539a4c8f605ad65e79&q=onion+soup";

    // Convert temporary URL into a URL type and request it
    tempURLString = [tempURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *requestURL = [NSURL URLWithString:tempURLString];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:0 timeoutInterval:60.0f];
  //  [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];

    // Send our connection request
    [self setSentURL:tempURLString];
    [self setConnection:[NSURLConnection connectionWithRequest:request delegate:self]]; //we are the delegate, must add in nsurl connection function

}



/*
    Data may come in parts, have to handle it
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"Downloading data...");
    [self.responseData appendData:data];
    
    //NSString *text = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    //NSLog(text);
}


/*
    Once finished loading, this is called.
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"Connection succeeded! Received %d bytes of data",[self.responseData length]);

}

@end