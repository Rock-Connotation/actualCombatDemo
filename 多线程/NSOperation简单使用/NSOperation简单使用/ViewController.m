//
//  ViewController.m
//  NSOperation简单使用
//
//  Created by 石子涵 on 2022/4/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addExecutionBlock];
//    [self creatInvOperation];
    NSInvocationOperation *invOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invTest) object:nil];
    NSInvocationOperation *operation =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test) object:nil];
    [invOperation addDependency:operation];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:invOperation];
    [queue addOperation:operation];
    
}

#pragma mark -NSInvocationOperation
///创建NSInvocationOperation
- (void)creatInvOperation{
    NSInvocationOperation *invOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invTest) object:nil];
    NSInvocationOperation *operation =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invTest) object:nil];
    NSInvocationOperation *operation2 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invTest) object:nil];
    NSInvocationOperation *operation3 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invTest) object:nil];
//    [invOperation start];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 3;
//    [queue addOperation:invOperation];
//    [queue addOperation:operation];
    [queue addOperations:@[invOperation, operation, operation2, operation3] waitUntilFinished:NO];
}
- (void)invTest{
    [NSThread sleepForTimeInterval:2];
    NSLog(@"任务A");
//    for (int i = 0; i < 5; i++) {
//        NSLog(@"%@--------------%d", [NSThread currentThread], i);
//    }
}

- (void)test{
    [NSThread sleepForTimeInterval:2];
    NSLog(@"任务B");
}
#pragma mark -NSBlockOperation
- (void)blockOperation{
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; i++) {
                   [NSThread sleepForTimeInterval:2];
                   NSLog(@"%d--%@",i,[NSThread currentThread]);
               }
    }];
    [blockOperation start];
}

#pragma mark -NSBlockOperation
- (void)addExecutionBlock {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"blockOperation--%@", [NSThread currentThread]);
        }
    }];
    [operation addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"executionBlock1--%@", [NSThread currentThread]);
        }
    }];
    [operation addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"executionBlock2--%@", [NSThread currentThread]);
        }
    }];
//    [operation addExecutionBlock:^{
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"executionBlock3--%@", [NSThread currentThread]);
//        }
//    }];
//    [operation addExecutionBlock:^{
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"executionBlock4--%@", [NSThread currentThread]);
//        }
//    }];
//    [operation addExecutionBlock:^{
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"executionBlock5--%@", [NSThread currentThread]);
//        }
//    }];
    [operation start];
}


@end
