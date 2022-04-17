//
//  AppManager.m
//  dispatch_once
//
//  Created by 石子涵 on 2022/4/7.
//

#import "AppManager.h"

@implementation AppManager
+ (instancetype)sharedInstance{
    static AppManager *manager = nil;
    static dispatch_once_t appManagerTocken;
    dispatch_once(&appManagerTocken, ^{
        manager = [[super allocWithZone:nil] init];
    });
    return manager;
}
@end
