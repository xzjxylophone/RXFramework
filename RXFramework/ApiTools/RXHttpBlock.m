//
//  RXHttpBlock.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXHttpBlock.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "OpenUDID.h"
#import "RXError.h"
@interface RXHttpBlock ()
@property (nonatomic, retain) AFHTTPRequestOperation *httpClient;
@property (nonatomic, retain) NSThread *parseThread;
@property (nonatomic, retain) NSOperationQueue *operationlist;
@property (nonatomic, retain) NSInvocationOperation *parseTask;
@property (nonatomic, retain) NSBlockOperation *blockTask;
@property (nonatomic, retain) AFHTTPRequestOperationManager * httpManager;

@end

@implementation RXHttpBlock

+ (RXHttpBlock *)queryCarListWithSuccess:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure
{
    NSString *hostUrl = @"http://123.57.65.251:9161/service/getCarList.do";
    NSDictionary *dic = @{@"lng":@"146.222",
                          @"lat":@"39.654",
                          @"listNum":@"6",
                          @"pageNo":@"0"};
    NSString *param = [self parametersFromDictionary:dic];
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http postRequestByHostUrl:hostUrl withParameters:param success:^(id contentObject) {
        if(success) {
            success(http, contentObject);
        }
    } failure:failure];
    return http;
}


+ (RXHttpBlock *)sendVerifyCodeWithMobile:(NSString *)mobile success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure
{
    NSString *hostUrl = @"http://123.57.65.251:9161/service/sendVerifyCode.do";
    NSDictionary *dic = @{SKey_mobile:mobile};
    NSString *param = [self parametersFromDictionary:dic];
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http postRequestByHostUrl:hostUrl withParameters:param success:^(id contentObject) {
        if(success) {
            success(http, contentObject);
        }
    } failure:failure];
    return http;
}


+ (RXHttpBlock *)loginWithMobile:(NSString *)mobile code:(NSString *)code success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure
{
    NSString *hostUrl = @"http://123.57.65.251:9161/service/login.do";
    NSDictionary *dic = @{SKey_mobile:mobile,
                          SKey_code:code};
    NSString *param = [self parametersFromDictionary:dic];
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http postRequestByHostUrl:hostUrl withParameters:param success:^(id contentObject) {
        if(success) {
            success(http, contentObject);
        }
    } failure:failure];
    return http;
}


+ (RXHttpBlock *)getCarDetailWithCarId:(NSString *)carId success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure
{
    NSString *hostUrl = @"http://123.57.65.251:9161/service/getCarDetail.do";
    NSDictionary *dic = @{SKey_carId:carId};
    NSString *param = [self parametersFromDictionary:dic];
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http postRequestByHostUrl:hostUrl withParameters:param success:^(id contentObject) {
        if(success) {
            success(http, contentObject);
        }
    } failure:failure];
    return http;
}




















#pragma mark - RXHttpBlock Get Post Upload

+ (RXHttpBlock *)getHttpStringByHostUrl:(NSString *)hostUrl withParameters:(NSString *)parameters success:(void (^)(RXHttpBlock *, id))success failure:(void (^)(NSError *))failure
{
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http getRequestByHostUrl:hostUrl withParameters:parameters  success:^(id contentObject) {
        if(success) {
            success(http, contentObject);
        }
    } failure:failure];
    return http;
}
+ (RXHttpBlock *)postHttpStringByHostUrl:(NSString *)hostUrl withParameters:(NSString *)parameters success:(void (^)(RXHttpBlock *, id))success failure:(void (^)(NSError *))failure
{
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpClient = [http postRequestByHostUrl:hostUrl withParameters:parameters success:^(id contentObject) {
        if(success) {
            success(http,contentObject);
        }
    } failure:failure];
    return http;
}
+ (RXHttpBlock *)postHttpUPLoadUrl:(NSString*)url withParameters:(id)parameter UpLoadImage:(UIImage*)image FileName:(NSString*)fileName success:(void (^)(RXHttpBlock *, id))success failure:(void (^)(NSError *))failure
{
    RXHttpBlock *http = [[RXHttpBlock alloc] init];
    http.httpManager = [http postUpLoadImageByHostUrl:url withParameters:parameter UpLoadImage:image FileName:fileName success:^(id contentObj) {
        if(success) {
            success(http, contentObj);
        }
    } failure:failure];
    return http;
}


#pragma mark - Base Method
+ (NSString *)hostUrlWithStr:(NSString *)str
{
    NSString *host = @"http://123.56.133.88:8081"; // 开发环境
    NSString *reulst = [NSString stringWithFormat:@"%@/%@", host, str];
    return reulst;
}
+ (NSString *)parametersFromDictionary:(NSDictionary *)dic
{
    NSMutableArray *ary = [NSMutableArray array];
    for (NSString *key in dic.allKeys) {
        NSString *value = [dic objectForKey:key];
        [ary addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    NSString *result = [ary componentsJoinedByString:@"&"];
    return result;
}


#pragma mark - AFNetWork Get Post Upload

-(AFHTTPRequestOperation *)getRequestByHostUrl:(NSString *)hostUrl withParameters:(NSString *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //white encode
    NSString *url = [hostUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if(parameters != nil)  {
        parameters = [parameters stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSString stringWithFormat:@"%@?%@", hostUrl, parameters];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *resultOperation,id contentObject){
        NSString *resultString = [[NSString alloc] initWithData:contentObject encoding:NSUTF8StringEncoding];
        if(success && !resultOperation.isCancelled) {
            success(resultString);
        }
    } failure:^(AFHTTPRequestOperation *resultOperation, NSError *error){
        if(failure && !resultOperation.isCancelled) {
            failure(error);
        }
        NSLog(@"error:%@", error);
    }];
    [operation start];
    return operation;
}

- (AFHTTPRequestOperation *)postRequestByHostUrl:(NSString *)hostUrl withParameters:(NSString *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSData *postData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", hostUrl]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:45];
    [request setHTTPBody:postData];
    [request setHTTPMethod:@"POST"];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *resultOperation, id contentObject) {
        NSString *resultString = [[NSString alloc] initWithData:contentObject encoding:NSUTF8StringEncoding];
        if(success && !resultOperation.isCancelled) {
            success(resultString);
        }
    } failure:^(AFHTTPRequestOperation *resultOperation, NSError *error) {
        if(failure && !resultOperation.isCancelled) {
            failure(error);
        }
        NSLog(@"error:%@", error);
    }];
    NSLog(@"url:%@", hostUrl);
    if (parameters.length < 500) {
        NSLog(@"parameters:%@", parameters);
    }
    [operation start];
    return operation;
}

- (AFHTTPRequestOperationManager*)postUpLoadImageByHostUrl:(NSString*)hostUrl withParameters:(id)parameter UpLoadImage:(UIImage*)image FileName:(NSString*)fileName success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:hostUrl parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData * data = UIImageJPEGRepresentation(image, 0.8);
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"images/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success && !operation.isCancelled) {
            success (responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure && !operation.isCancelled) {
            failure(error);
        }
        NSLog(@"error:%@", error);
    }];
    return manager;
}
@end
