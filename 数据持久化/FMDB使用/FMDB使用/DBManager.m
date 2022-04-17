//
//  DBManager.m
//  FMDB使用
//
//  Created by 石子涵 on 2022/4/8.
//

#import "DBManager.h"
#import <FMDB/FMDB.h>
@implementation DBManager
+ (instancetype)shareInstance{
    static DBManager *manager = nil;
    dispatch_once_t DBTocken;
    dispatch_once(&DBTocken, ^{
        manager = [[DBManager allocWithZone:nil] init];
    });
    return manager;
}

@end
