//
//  GGRequest.m
//  MyDota
//
//  Created by Xiang on 15/10/15.
//  Copyright © 2015年 iOGG. All rights reserved.
//

#import "GGRequest.h"
#import "UIWebView+AFNetworking.h"

@implementation GGRequest

+(void)requestWithUrl:(NSString *)url accepType:(NSString *)type withSuccess:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    if ([type isEqualToString:@"text"]||[type isEqualToString:@"html"]) {
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(operation,responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}


@end
