//
//  MAApiManager.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 10/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MATrackPonso;

typedef void (^MAApiManagerSearchHandler)(NSArray <MATrackPonso *> *objects, NSError *error);

@protocol MAApiManager <NSObject>

- (NSURLSessionTask *)searchTrackWithQuery:(NSString *)query
                                    offset:(NSInteger)offset
                                   handler:(MAApiManagerSearchHandler)handler;

@end