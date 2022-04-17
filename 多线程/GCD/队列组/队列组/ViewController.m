//
//  ViewController.m
//  队列组
//
//  Created by 石子涵 on 2022/4/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self groupNotify];
    [self groupWait];
    
}

///队列组 dispatch_group_notify
- (void)groupNotify{
    NSLog(@"group begin");
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //追加任务1
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1---%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //追加任务2
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2---%@",[NSThread currentThread]);
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //1和2完成之后才会完成当前任务
        [NSThread sleepForTimeInterval:2];
        NSLog(@"3---%@",[NSThread currentThread]);
        NSLog(@"group end");
    });
    
}

//队列组
- (void)groupWait{
    NSLog(@"group begin");
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //追加任务1
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1---%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //追加任务2
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2---%@",[NSThread currentThread]);
    });
    
    //在前面任务完成后才会执行后面的代码
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"end");
}


@end
