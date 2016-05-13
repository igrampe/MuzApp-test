//
//  MAApiManagerImpl.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 13/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "MAApiManagerImpl.h"

#import <AFNetworking.h>
#import "Constants.h"

#import "MATrackPonso.h"

typedef void (^MARequestCompetionHandler)(NSURLResponse *response, id responseObject, NSError *error);

@implementation MAApiManagerImpl

- (NSURLSessionTask *)searchTrackWithQuery:(NSString *)query
                                    offset:(NSInteger)offset
                                   handler:(MAApiManagerSearchHandler)handler
{
    NSURLSessionDataTask *task = nil;
    NSMutableDictionary *params = [@{@"media":@"music",
                                     @"entity":@"song",
                                     @"version":@(2),
                                     @"explicit":@"YES"} mutableCopy];
    if (query)
    {
        params[@"term"] = query;
    }
    
    task = [self getWithUrl:API_SEARCH
                     params:params
          completionHandler:
    ^(NSURLResponse *response, id responseObject, NSError *error)
    {
        NSArray *objects = nil;
        NSError *err = error;
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSArray *results = responseObject[@"results"];
            objects = [EKMapper arrayOfObjectsFromExternalRepresentation:results
                                                             withMapping:[MATrackPonso objectMapping]];
        } else
        {
            if (!err)
            {
                err = [NSError errorWithDomain:APP_DOMAIN
                                          code:-1000
                                      userInfo:@{@"LocalizedSescription":NSLS(@"Неизветсная ошибка")}];
            }
        }
        if (handler)
        {
            handler(objects, err);
        }
    }];
    
    return task;
}

#pragma mark - Private

- (NSURLSessionDataTask *)getWithUrl:(NSString *)url
                              params:(NSDictionary *)params
                   completionHandler:(MARequestCompetionHandler)handler
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                 URLString:url
                                                                                parameters:params
                                                                                     error:nil];
    
    return [self downloadTaskForRequest:request completionHandler:handler];
}

- (NSURLSessionDataTask *)downloadTaskForRequest:(NSURLRequest *)request
                               completionHandler:(MARequestCompetionHandler)handler
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:handler];
    [dataTask resume];
    
    return dataTask;
}

@end
