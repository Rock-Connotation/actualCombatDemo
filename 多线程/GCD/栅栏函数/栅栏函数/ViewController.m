//
//  ViewController.m
//  栅栏函数
//
//  Created by 石子涵 on 2022/4/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self barrier];
//    [self test];
    // Do any additional setup after loading the view.
}
- (void)barrier {
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 4
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
    });
}
- (void)test{
    dispatch_queue_t queue = dispatch_queue_create("net", DISPATCH_QUEUE_CONCURRENT);;
    dispatch_async(queue, ^{
        NSLog(@"------1--------,%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"--------2--------,%@", [NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"-------barrier-----%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"--------3--------,%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"--------4--------,%@", [NSThread currentThread]);
    });
}
@end
