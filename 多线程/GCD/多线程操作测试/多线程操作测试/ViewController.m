//
//  ViewController.m
//  多线程操作测试
//
//  Created by 石子涵 on 2022/4/4.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int arr[] = { DISPATCH_QUEUE_PRIORITY_LOW, DISPATCH_QUEUE_PRIORITY_HIGH, DISPATCH_QUEUE_PRIORITY_DEFAULT, DISPATCH_QUEUE_PRIORITY_BACKGROUND};
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 4; ++j) {
            dispatch_queue_t q1 = dispatch_get_global_queue(arr[j], 0);
            NSString *str = [NSString stringWithFormat:@"%p", q1];
            int cnt = [dict[str] intValue] + 1;
            dict[str] = @(cnt);
        }
    }
    NSLog(@"%@", dict);
    
//    dispatch_queue_t asyncQueen = dispatch_queue_create("async", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t syncQueen = dispatch_queue_create("sync", DISPATCH_QUEUE_CONCURRENT);
//    __block int cnt = 0;
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(asyncQueen, ^{
//            NSLog(@"async %d, %@", i, [NSThread currentThread]);
//            dispatch_sync(syncQueen, ^{
//                NSLog(@"sync %d, %@", i, [NSThread currentThread]);
//                cnt++;
//            });
//            NSLog(@"111");
//        });
//    }
    // Do any additional setup after loading the view.
}


@end
