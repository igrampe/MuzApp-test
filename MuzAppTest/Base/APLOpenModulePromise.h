//
//  MAOpenModulePromise.h
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 15/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APLModuleInput;
@protocol APLModuleOutput;

typedef void(^APLPostLinkActionBlock)();
typedef id<APLModuleOutput>(^APLModuleLinkBlock)(id<APLModuleInput> moduleInput);

@interface APLOpenModulePromise : NSObject

@property (nonatomic, strong) id<APLModuleInput> moduleInput;
@property (nonatomic,strong) APLPostLinkActionBlock postLinkActionBlock;

- (void)linkUsingBlock:(APLModuleLinkBlock)linkBlock;

@end
