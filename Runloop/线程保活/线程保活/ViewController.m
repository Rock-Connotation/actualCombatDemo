//
//  ViewController.m
//  线程保活
//
//  Created by 石子涵 on 2022/4/3.
//

#import "ViewController.h"
#import "LSThread.h"
@interface ViewController ()
@property (nonatomic, assign) BOOL isStopThread;
@property (nonatomic, strong) LSThread *thread;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    self.thread = [[LSThread alloc] initWithBlock:^{
//        NSLog(@"func -- %s   thread -- %@", __func__, [NSThread currentThread]);
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        while (!weakSelf.isStopThread) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }];
    [self.thread start];
    
    //设置5秒之后销毁
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopAction];
    });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self performSelector:@selector(hit) onThread:self.thread withObject:nil waitUntilDone:NO];
}
- (void)hit{
    NSLog(@"hit test");
}
- (void)stopAction{
    //停止操作一定要在我们的目标线程执行，比如我们直接调用 stop方法并不能达到我们预期的效果，这是因为stop 默认在主线程执行，没有拿到目标线程，停止无效。
    [self performSelector:@selector(stop) onThread:self.thread withObject:nil waitUntilDone:NO];
    self.thread = nil;  //这里要置空
}
- (void)stop{
    self.isStopThread = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

@end
