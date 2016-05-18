//
//  APLOpenModulePromise.m
//  MuzAppTest
//
//  Created by Semyon Belokovsky on 15/05/16.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "APLOpenModulePromise.h"

#import "APLModuleInput.h"
#import "APLModuleOutput.h"

@interface APLOpenModulePromise ()

@property (nonatomic, strong) APLModuleLinkBlock linkBlock;
@property (nonatomic, assign) BOOL linkBlockWasSet;
@property (nonatomic, assign) BOOL moduleInputWasSet;

@end

@implementation APLOpenModulePromise

- (void)setModuleInput:(id<APLModuleInput>)moduleInput
{
    _moduleInput = moduleInput;
    self.moduleInputWasSet = YES;
    [self tryPerformLink];
}

- (void)linkUsingBlock:(APLModuleLinkBlock)linkBlock
{
    self.linkBlock = linkBlock;
    self.linkBlockWasSet = YES;
    [self tryPerformLink];
}

- (void)tryPerformLink
{
    if (self.linkBlockWasSet && self.moduleInputWasSet)
    {
        [self performLink];
    }
}

- (void)performLink
{
    if (self.linkBlock != nil)
    {
        id<APLModuleOutput> moduleOutput = self.linkBlock(self.moduleInput);
        if ([self.moduleInput respondsToSelector:@selector(setModuleOutput:)]) {
            [self.moduleInput setModuleOutput:moduleOutput];
        }
        if (self.postLinkActionBlock)
        {
            self.postLinkActionBlock();
        }
    }
}

@end
