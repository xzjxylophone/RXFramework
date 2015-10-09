//
//  RXHttpBlock.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXHttpBlock.h"

#import "RXError.h"
#import "RXApiResult.h"
#import "NSDictionary+RXUtility.h"
@interface RXHttpBlock ()

@end

@implementation RXHttpBlock





// Demo
+ (RXHttpBlock *)queryCarListWithBlock:(void (^)(RXHttpBlock *http, RXApiResult *apiResult, NSError *error))block
{
    NSString *hostUrl = @"http://123.57.65.251:9161/service/getCarList.do";
    NSDictionary *dic = @{@"lng":@"146.222",
                          @"lat":@"39.654",
                          @"listNum":@"6",
                          @"pageNo":@"0"};
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    [http POSTWithUrl:hostUrl parameters:dic block:^(id contentObject, NSError *error) {
        RXApiResult *result = [[RXApiResult alloc] initWithResultString:contentObject];
        if (block != nil) {
            block(http, result, error);
        }
    }];
    return http;
}



#pragma mark - Get Post Method
- (void)GETWithUrl:(NSString *)url parameters:(NSDictionary *)parameters block:(void (^)(id contentObject, NSError *error))block
{
    self.httpOperationManager = [AFHTTPRequestOperationManager manager];
    self.httpOperationManager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    self.httpOperation = [self.httpOperationManager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (block != nil) {
            block(responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block != nil) {
            block(nil, error);
        }
    }];
}

- (void)POSTWithUrl:(NSString *)url parameters:(NSDictionary *)parameters block:(void (^)(id contentObject, NSError *error))block
{
    NSString *parametersStr = [NSDictionary rx_keyValueStringFromDictionary:parameters];
    NSData *postData = [parametersStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:45];
    [request setHTTPBody:postData];
    [request setHTTPMethod:@"POST"];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    self.httpOperation = operation;
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *resultOperation, id contentObject) {
        if(block && !resultOperation.isCancelled) {
            block(contentObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *resultOperation, NSError *error) {
        if(block && !resultOperation.isCancelled) {
            block(nil, error);
        }
    }];
    [operation start];
}





































































@end
