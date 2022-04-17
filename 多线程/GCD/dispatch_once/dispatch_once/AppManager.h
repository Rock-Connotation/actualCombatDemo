//
//  AppManager.h
//  dispatch_once
//
//  Created by 石子涵 on 2022/4/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppManager : NSObject
+ (instancetype)sharedInstance;

#pragma mark -方法一：在对象创建的时候，无论是 alloc 还是 new，都会调用到 allocWithZone: 方法；使用拷贝创建对象时，会调用 copyWithZone:，mutableCopyWithZone:方法；那么，重写这些方法，就可以让创建的对象唯一

#pragma mark -方法二：禁用alloc、new 、copy等方法
//+(instancetype) alloc __attribute__((unavailable("replace with 'sharedInstance'")));
//
//+(instancetype) new __attribute__((unavailable("replace with 'sharedInstance'")));
//
//-(instancetype) copy __attribute__((unavailable("replace with 'sharedInstance'")));
//
//-(instancetype) mutableCopy __attribute__((unavailable("replace with 'sharedInstance'")));

@end

NS_ASSUME_NONNULL_END
