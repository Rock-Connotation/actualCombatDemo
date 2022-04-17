//
//  ViewController.m
//  延时执行
//
//  Created by 石子涵 on 2022/4/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1");
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2* NSEC_PER_SEC));
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"3");
    });
    // Do any additional setup after loading the view.
}


@end
