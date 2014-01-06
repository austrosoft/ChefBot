//
//  CBNetworkConnection.h
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBNetworkConnection;

@protocol CBNetworkConnectionDelegate <NSObject>
@required
- (void)networkConnection:(CBNetworkConnection *)networkConnection connectionError:(id)errorCode command:(NSString*)command;
- (void)networkConnection:(CBNetworkConnection *)networkConnection connectionSuccessful:(id)localMessage command:(NSString*)command;
@end



@interface CBNetworkConnection : NSObject
@property (weak) id <CBNetworkConnectionDelegate> delegate;
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSString *sentURL;
@property (strong, nonatomic) NSMutableData *responseData;

+ (instancetype) networkConnection;

- (void) createNewConnection: (NSString *) command parameters: (id) parameters;





@end
